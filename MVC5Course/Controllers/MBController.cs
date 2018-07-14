using MVC5Course.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC5Course.Controllers
{
    public class MBController : BaseController
    {
        private FabricsEntities db = new FabricsEntities();

        // GET: MB
        public ActionResult Index()
        {
            var data = "Hello World";
            ViewData.Model = data;
            return View();
        }

        public ActionResult ViewBagDemo()
        {
            ViewData["Data"] = db.Client.Take(5).ToList();

            ViewBag.Text = "Hi";
            return View();
        }
        public ActionResult ViewDataDemo()
        {
            ViewData["Text"] = "Hi";
            return View();
        }

        public ActionResult TempDataSave()
        {
            TempData["Text"] = "Temp";

            return RedirectToAction("TempDataDemo");
        }

        public ActionResult TempDataDemo()
        {
            return View();
        }
    }
}