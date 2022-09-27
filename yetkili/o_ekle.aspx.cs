using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BLibraryPortal.yetkili
{
    public partial class okuyucu_ekle : System.Web.UI.Page
    {
        string cinsiyet;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string [] unvan = { "Lütfen seçim yapınız", "Öğrenci", "Öğretmen", "Diğer" };

            if (!IsPostBack)
            {
                for (int i = 0; i < unvan.Length; i++)
                {
                    DropDownList1.Items.Add(unvan[i]);
                }
            }

            if (RadioButton1.Checked == true)
            {
                cinsiyet = RadioButton1.Text;
            }
            if (RadioButton2.Checked == true)
            {
                cinsiyet = RadioButton2.Text;
            }
        }
        public void temizle()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue=="Öğrenci")
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //tconay.Visible = false; //diğer uyarı mesajları eklenbilir

            Cs.Okuyucu okuyucu = new Cs.Okuyucu();
            Cs.OkuyucuCRUD okuyucuCRUD = new Cs.OkuyucuCRUD();

            bool cevap1 = okuyucuCRUD.tconay(TextBox1.Text);
            if (cevap1 == false) //tc kayıtlı değilse
            {
                if (DropDownList1.SelectedValue == "Öğrenci")
                {
                    okuyucu.No = Convert.ToInt16(TextBox2.Text);
                    okuyucu.Sinif = TextBox3.Text;
                }
                else
                {
                    okuyucu.No = 0;
                    okuyucu.Sinif = "";
                }
                okuyucu.Tc = TextBox1.Text;
                okuyucu.Unvan = DropDownList1.SelectedValue;
                okuyucu.Ad = TextBox4.Text;
                okuyucu.Soyad = TextBox5.Text;
                okuyucu.Cinsiyet = cinsiyet;
                okuyucu.Tel = TextBox6.Text;
                okuyucu.Dtarih = Convert.ToDateTime(TextBox7.Text);
                okuyucu.Puan = Convert.ToInt16(TextBox8.Text);

                bool cevap = okuyucuCRUD.ekle(okuyucu);

                if (cevap == true)
                {
                    tchata.Visible = false;
                    kayitbasarili.Visible = true;
                    //Label1.Text = "Kayıt edildi";
                    temizle();
                }
                else
                {
                    tchata.Visible = false;
                    kayithatali.Visible = true;
                    //Label1.Text = "Kayıt edilemedi";
                    temizle();
                }
            }
            else
            {
                //Response.Write("<script>window.alert('Bu TC kimlik numarası zaten kullanımda')</script>");

                tchata.Visible = true;

                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "tchataModal",
                //    "$('#tchataModal').modal();", true);
            }
        }
    }
}