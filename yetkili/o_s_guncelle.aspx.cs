using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BLibraryPortal.yetkili
{
    public partial class okuyucu_s_güncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string silinecekprm = Request.QueryString["silprm"];

            if (silinecekprm!=null)
            {
                BLibraryPortal.Cs.OkuyucuCRUD okuyucusil = new Cs.OkuyucuCRUD();

                bool cevap = okuyucusil.sil(silinecekprm);

                if (cevap == true)
                {
                    silmehatali.Visible = false;
                    silmebasarili.Visible = true;
                }
                else
                {
                    silmebasarili.Visible = false;
                    silmehatali.Visible = true;
                }
            }
            
        }
    }
}