using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BLibraryPortal.yetkili
{
    public partial class i_odunc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            okuyucuyok.Visible = false;
            okuyucugoster.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BLibraryPortal.Cs.OkuyucuCRUD okuyucuvarmi = new BLibraryPortal.Cs.OkuyucuCRUD();
            System.Data.DataTable dt = new System.Data.DataTable();

            dt = okuyucuvarmi.okuyucugoster(TextBox1.Text);

            if (dt.Rows.Count == 0)
            {
                okuyucuyok.Visible = true;
                kitapgoster.Visible = false;
            }
            else
            {
                okuyucugoster.Visible = true;
                okuyucugoster.InnerHtml = "<div class='table - responsive'>" +
                                        "<table class='table table-striped'>" +

                                        "<tr><td>Okuyucu adı</td><td>:</td><td>" + dt.Rows[0][4] + "</td></tr>" +
                                        "<tr><td>Okuyucu soyadı</td><td>:</td><td>" + dt.Rows[0][5] + "</td></tr>" +
                                        "<tr><td>Okuyucu puanı</td><td>:</td><td>" + dt.Rows[0][9] + "</td></tr>" +

                                        "</table>" +
                                        "</div>";
                
                kitapgoster.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }
    }
}