using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BLibraryPortal.yetkili
{
    public partial class o_guncelle : System.Web.UI.Page
    {
        string cinsiyet;
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] unvan = { "Lütfen seçim yapınız", "Öğrenci", "Öğretmen", "Diğer" };

            if (!IsPostBack)
            {
                for (int i = 0; i < unvan.Length; i++)
                {
                    DropDownList1.Items.Add(unvan[i]);
                }
                
                string tc = Request.QueryString["gprmtc1"];
                BLibraryPortal.Cs.OkuyucuCRUD okuyucuCRUD = new Cs.OkuyucuCRUD();
                DataTable gdt = okuyucuCRUD.okuyucugoster(tc);

                TextBox1.Text = gdt.Rows[0][0].ToString();
                DropDownList1.SelectedItem.Text = gdt.Rows[0][1].ToString();
                TextBox2.Text = gdt.Rows[0][2].ToString();
                TextBox3.Text = gdt.Rows[0][3].ToString();
                TextBox4.Text = gdt.Rows[0][4].ToString();
                TextBox5.Text = gdt.Rows[0][5].ToString();
                TextBox6.Text = gdt.Rows[0][7].ToString();

                if (gdt.Rows[0][6].ToString() == "Kadın")
                {
                    RadioButton1.Checked = true;
                }
                else
                {
                    RadioButton2.Checked = true;
                }

                TextBox7.Text = (Convert.ToDateTime(gdt.Rows[0][8].ToString())).ToShortDateString();
                TextBox8.Text = gdt.Rows[0][9].ToString();
            }

            //if (RadioButton1.Checked == true)
            //{
            //    cinsiyet = RadioButton1.Text;
            //}
            //if (RadioButton2.Checked == true)
            //{
            //    cinsiyet = RadioButton2.Text;
            //}
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Öğrenci")
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
            BLibraryPortal.Cs.OkuyucuCRUD guncel = new BLibraryPortal.Cs.OkuyucuCRUD();
            BLibraryPortal.Cs.Okuyucu okuyucu = new BLibraryPortal.Cs.Okuyucu();

            okuyucu.Tc = TextBox1.Text;
            okuyucu.Unvan = DropDownList1.SelectedValue;
            okuyucu.Sinif = TextBox3.Text;
            okuyucu.Ad = TextBox4.Text;
            okuyucu.Soyad = TextBox5.Text;

            if (RadioButton1.Checked == true)
            {
                cinsiyet = RadioButton1.Text;
            }
            if (RadioButton2.Checked == true)
            {
                cinsiyet = RadioButton2.Text;
            }

            okuyucu.Cinsiyet = cinsiyet;
            okuyucu.Tel = TextBox6.Text;
            okuyucu.Dtarih = Convert.ToDateTime(TextBox7.Text);
            okuyucu.Puan = Convert.ToInt16(TextBox8.Text);

            bool cevap = guncel.guncelle(okuyucu);
            if (cevap)
            {
                kayitbasarili.Visible = true;
            }
            else
            {
                kayithatali.Visible = true;
            }
        }
    }
}