using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Excel allows me to use ExcelDataReader
//System.IO allows me to use FileStream
//System.Data allows me to use DataSet
//PokeTracker.Database allows me to create a Db connection
using PokeTracker.Database;
using System.Data;
using System.IO;
using Excel;

using System.Net;
using System.Text.RegularExpressions;

namespace PokeTracker
{
    public partial class PokemonList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();



            var PokemonInfo =
                from Pokemon in db.PT_Pokemons
                let Type1 = Pokemon.PT_PokemonHasTypes.First().PT_Type.Type
                let Type2 = Pokemon.PT_PokemonHasTypes.Count() > 1 ? Pokemon.PT_PokemonHasTypes.Skip(1).First().PT_Type.Type : ""
                select new
                {
                    Pokemon.ID,
                    Pokemon.Name,
                    Type1,
                    Type2
                };

            rptPokemon.DataSource = PokemonInfo;
            rptPokemon.DataBind();
            
        }

        protected void uploadAttacks(object sender, EventArgs e)
        {
            //Following Instructions found here https://github.com/ExcelDataReader/ExcelDataReader
            //This reads in an excel file.
            string filePath = @"C:\Users\Griever815\Downloads\PokemonGo.xlsx";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            DataSet result = excelReader.AsDataSet();
            excelReader.Close();

            //Creates a Datatable that can be read from your ExcelDataReader Import.
            //The Tables[0] index indicates which sheet in the spreadsheet you are importing.
            DataTable resultTable = result.Tables[1];

            //Creates a database connection.
            DataClasses1DataContext db = new DataClasses1DataContext();

            //For each row in the resulting Datatable, it loops through and creates a new pokemon object.
            foreach (DataRow row in resultTable.Rows)
            {
                
                //With every iteration, a new pokemon is made and inserted into the database.
                PT_Attack Attack = new PT_Attack();

                //I use this to get the type from the Type Table. This is called Lambda
                //It allows you to get a single row from the database at a time, based on information you want.
                string typeName = row[1].ToString();
                PT_Type attackType = db.PT_Types.Single(p => p.Type == typeName);

                //I use Trim() to get rid of whitespace on either side of the value.
                //The row[0] index indicates which cell you are using in that row of hte spreadsheet.
                Attack.Name = row[0].ToString().Trim();
                Attack.TypeID = attackType.ID;
                Attack.DPS = Convert.ToDouble(row[2].ToString().Trim());
                Attack.Damage = Convert.ToInt32(row[3].ToString().Trim());
                Attack.Seconds = Convert.ToDouble(row[4].ToString().Trim());
                Attack.Energy = Convert.ToInt32(row[5].ToString().Trim());
                Attack.IsChargeMove = Convert.ToBoolean(Convert.ToInt32(row[6].ToString().Trim()));

                db.PT_Attacks.InsertOnSubmit(Attack);
            }
            db.SubmitChanges();
        }

        protected void importPokemon(object sender, EventArgs e)
        {
            //Following Instructions found here https://github.com/ExcelDataReader/ExcelDataReader
            //This reads in an excel file.
            string filePath = @"C:\Users\Griever815\Downloads\PokemonGO.xlsx";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            DataSet result = excelReader.AsDataSet();
            excelReader.Close();

            //Creates a Datatable that can be read from your ExcelDataReader Import.
            //The Tables[0] index indicates which sheet in the spreadsheet you are importing.
            DataTable resultTable = result.Tables[0];

            //Creates a database connection.
            DataClasses1DataContext db = new DataClasses1DataContext();

            //For each row in the resulting Datatable, it loops through and creates a new pokemon object.
            foreach (DataRow row in resultTable.Rows)
            {
                //With every iteration, a new pokemon is made and inserted into the database.
                PT_Pokemon Pokemon = new PT_Pokemon();

                //I use Trim() to get rid of whitespace on either side of the value.
                //The row[0] index indicates which cell you are using in that row of hte spreadsheet.
                Pokemon.ID = Convert.ToInt32(row[0].ToString().Trim());
                Pokemon.Name = row[1].ToString().Trim();
                Pokemon.ImagePath = row[0].ToString().Trim() + ".png";

                db.PT_Pokemons.InsertOnSubmit(Pokemon);
            }
            db.SubmitChanges();
        }
        
        protected void importPokeType(object sender, EventArgs e)
        {
            //Following Instructions found here https://github.com/ExcelDataReader/ExcelDataReader
            //This reads in an excel file.
            string filePath = @"C:\Users\Griever815\Downloads\PokemonGO.xlsx";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            DataSet result = excelReader.AsDataSet();
            excelReader.Close();

            //Creates a Datatable that can be read from your ExcelDataReader Import.
            //The Tables[0] index indicates which sheet in the spreadsheet you are importing.
            DataTable resultTable = result.Tables[0];

            //Creates a database connection.
            DataClasses1DataContext db = new DataClasses1DataContext();

            //For each row in the resulting Datatable, it loops through and creates a new pokemon object.
            foreach (DataRow row in resultTable.Rows)
            {
                //With every iteration, a new PokemonHasType is made and inserted into the database.
                PT_PokemonHasType PHT1 = new PT_PokemonHasType();

                //THere are two possible types for a pokemon.
                string pokeType1 = row[2].ToString();
                string pokeType2 = row[3].ToString();

                //Grabs a single pokemon from the database where the ID matches the one being imported.
                PT_Pokemon Pokemon = db.PT_Pokemons.Single(p => p.ID == Convert.ToInt32(row[0].ToString().Trim()));

                //Grabs the first type from the database where it matches the type being imported.
                PT_Type Type1 = db.PT_Types.Single(p => p.Type.ToLower() == pokeType1);

                PHT1.PokemonID = Pokemon.ID;
                PHT1.TypeID = Type1.ID;
                db.PT_PokemonHasTypes.InsertOnSubmit(PHT1);

                //Some pokemon only have one type, so this factors that in and allows for a second instance.
                if (pokeType2 != "none")
                {
                    PT_PokemonHasType PHT2 = new PT_PokemonHasType();
                    
                    //Grabs the second type from the database where it matches the type being imported.
                    PT_Type Type2 = db.PT_Types.Single(p => p.Type.ToLower() == pokeType2);

                    PHT2.TypeID = Type2.ID;
                    PHT2.PokemonID = Pokemon.ID;
                    db.PT_PokemonHasTypes.InsertOnSubmit(PHT2);
                }
            }
            db.SubmitChanges();
        }

        protected void OpenModal(object sender, EventArgs e)
        {
            LinkButton LBPokeID = (LinkButton)sender;
            RepeaterItem RITest = (RepeaterItem)LBPokeID.Parent;       
            HiddenField HFTest = (HiddenField)RITest.FindControl("HFPokemonID");

            DataClasses1DataContext db = new DataClasses1DataContext();

            int pokeID = Convert.ToInt32(HFTest.Value);
            PT_Pokemon Pokemon = db.PT_Pokemons.Single(p => p.ID == pokeID);

            var FastAttack =
                from PHA in Pokemon.PT_PokemonHasAttacks
                join attack in db.PT_Attacks on PHA.AttackID equals attack.ID
                where !attack.IsChargeMove
                select attack;

            var ChargeAttack =
                from PHA in Pokemon.PT_PokemonHasAttacks
                join attack in db.PT_Attacks on PHA.AttackID equals attack.ID
                where attack.IsChargeMove
                select attack;

            LPokeName.Text = "#" + Pokemon.ID + " " + Pokemon.Name;

            ImgPoke.ImageUrl = "images/" + Pokemon.ImagePath;
            
            rptFastAttacks.DataSource = FastAttack;
            rptFastAttacks.DataBind();

            rptChargeAttacks.DataSource = ChargeAttack;
            rptChargeAttacks.DataBind();

            myModal.Visible = true;
        }

    }
}