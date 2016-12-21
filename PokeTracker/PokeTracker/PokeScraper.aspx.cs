using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//These allow me to use REGEX to scrape a website.
using PokeTracker.Database;
using System.Net;
using System.Text.RegularExpressions;
using System.Timers;
using System.Threading;

namespace PokeTracker
{
    public partial class PokeScraper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void scrapeSite(object sender, EventArgs e)
        {
            //This function allows us to scrape a website for what we want using REGEX.
            //It uses several functions all tied together
            getAllLinks();

        }

        //Gets us the link
        const string LINKREGEX = @"#([0-9]{3})<.*(http:\/\/.*.html)";
        //Gets the picture
        const string IMGREGEX = @"Pokedex Entry.*Master.*(https:\/\/.*.png)";
        //Fast moves
        const string FASTREGEX = @"Moves Fast.*?_blank.*?>(.*?)<\/a>";
        //Charge Moves
        const string CHARGEREGEX = @"Moves Charge.*?_blank.*?>(.*?)<\/a>";
        protected void getAllLinks()
        {
            //Creates a webclient that we can then use to download a site's source code from to scrape
            WebClient wc = new WebClient();
            string content = wc.DownloadString("http://www.pokemongodb.net/2016/05/pokemon-go-pokedex.html");

            //Regex uses an expression and we are looking for matches. we have to create a new Regex, and then a match for it.
            Regex r = new Regex(LINKREGEX);
            Match m = r.Match(content);

            //A dictionary is used because we are getting a name and an ID.
            Dictionary<int, string> pokedex = new Dictionary<int, string>();

            while (m.Success)
            {
                //Regex groups are used to grab the specific info we want.
                int id = Convert.ToInt32(m.Groups[1].Value);
                string link = m.Groups[2].Value;

                //If the pokedex does not contain what we want, then add it in from the REGEX matches
                if (!pokedex.ContainsValue(link))
                {
                    pokedex.Add(id, link);
                }
                m = m.NextMatch();
            }

            //For each entry in the pokedex, we will call another function to continue to get more information
            foreach(KeyValuePair<int, string> pokemon in pokedex)
            {
                Thread.Sleep(20);
                scrape(pokemon.Key, pokemon.Value);
            }
        }

        protected void scrape(int id, string pokemon)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            WebClient wc = new WebClient();
            string content = wc.DownloadString(pokemon);

            Regex ImgR = new Regex(IMGREGEX);
            Regex FastR = new Regex(FASTREGEX);
            Regex ChargeR = new Regex(CHARGEREGEX);

            Match ImgM = ImgR.Match(content);
            Match FastM = FastR.Match(content);
            Match ChargeM = ChargeR.Match(content);

            //We are looking to download images. If the ImgM regex finds one, we download it and add it to the databse.
            /*
            if (ImgM.Success)
            {
                //Regex groups are used to grab the specific info we want.
                string Image = ImgM.Groups[1].Value;
                wc.DownloadFile(Image, @"C:\Users\Griever815\Dropbox\Microsoft Visual Studio 2015\Projects\PokeTracker\PokeTracker\images\" + id + ".png");
                string ImageName = id + ".png";

                //It allows you to get a single row from the database at a time, based on information you want.
                PT_Pokemon poke = db.PT_Pokemons.Single(p => p.ID == id);
                poke.ImagePath = ImageName;
               
                db.SubmitChanges();
            }
            */

            /*
            //A While loop is used in addition to the FastM.NextMatch() to ensure we hit every match.
            while (FastM.Success)
            {
                //Regex groups are used to grab the specific info we want.
                string FastAttack = FastM.Groups[1].Value;
                PT_Pokemon poke = db.PT_Pokemons.Single(p => p.ID == id);

                //This if statement allows for if a Pokemon only has one Fast attack, it doesnt throw and error and instead skips it.
                if (db.PT_Attacks.Any(p => p.Name.ToLower() == FastAttack.ToLower() && !p.IsChargeMove))
                {
                    //ToLower is used to avoid mismatches due to capitalization.
                    PT_Attack attack = db.PT_Attacks.Single(p => p.Name.ToLower() == FastAttack.ToLower() && !p.IsChargeMove);
                    PT_PokemonHasAttack PHA = new PT_PokemonHasAttack();

                    PHA.PokemonID = poke.ID;
                    PHA.AttackID = attack.ID;

                    db.PT_PokemonHasAttacks.InsertOnSubmit(PHA);
                }
                db.SubmitChanges();
                FastM = FastM.NextMatch();
            }
            */
            /*
            //A While loop is used in addition to the ChargeM.NextMatch() to ensure we hit every match.
            while (ChargeM.Success)
            {
                //Regex groups are used to grab the specific info we want.
                string ChargeAttack = ChargeM.Groups[1].Value;
                PT_Pokemon poke = db.PT_Pokemons.Single(p => p.ID == id);

                //This if statement allows for if a Pokemon only has one Fast attack, it doesnt throw and error and instead skips it.
                if (db.PT_Attacks.Any(p => p.Name.ToLower() == ChargeAttack.ToLower() && p.IsChargeMove))
                {
                    //ToLower is used to avoid mismatches due to capitalization.
                    PT_Attack attack = db.PT_Attacks.Single(p => p.Name.ToLower() == ChargeAttack.ToLower() && p.IsChargeMove);
                    PT_PokemonHasAttack PHA = new PT_PokemonHasAttack();

                    PHA.PokemonID = poke.ID;
                    PHA.AttackID = attack.ID;

                    db.PT_PokemonHasAttacks.InsertOnSubmit(PHA);
                }
                db.SubmitChanges();
                ChargeM = ChargeM.NextMatch();
            }
            */
        }
    }
}