using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MVC5Course.Controllers
{
    public class ARController : Controller
    {
        // GET: AR
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ViewTest()
        {
            string model = "MODEL";
            //return View((object)model);
            return PartialView((object)model);
        }


        public ActionResult ContentTest()
        {
            return Content("Test Content!",
                "text/plain",
                Encoding.GetEncoding("Big5"));
        }

        public ActionResult FileTest(string dl)
        {
            if (String.IsNullOrEmpty(dl))
            {
                return File(Server.MapPath("~/App_Data/42834332472_c3582b910b_b.jpg"),
                    "image/jpeg");
            }
            else
            {
                return File(Server.MapPath("~/App_Data/42834332472_c3582b910b_b.jpg"),
                    "image/jpeg", "My-FIFA-Picture.jpg");
            }
        }

    }
}