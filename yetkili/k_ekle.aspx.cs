using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BLibraryPortal.yetkili
{
    public partial class k_ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cs.KitapCRUD ylistele0 = new Cs.KitapCRUD();
                DataTable yazardt = ylistele0.yazarliste();
                DropDownList1.DataValueField = "y_no";
                DropDownList1.DataTextField = "yazar_adi";

                DropDownList1.DataSource = yazardt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));

                //-----//

                Cs.KitapCRUD tlistele1 = new Cs.KitapCRUD();
                DataTable turdt = tlistele1.turliste();
                DropDownList2.DataValueField = "t_no";
                DropDownList2.DataTextField = "t_ad";

                DropDownList2.DataSource = turdt;
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
            }
        }           

        protected void Button1_Click(object sender, EventArgs e)
        {
            Cs.Kitap kitap = new Cs.Kitap(); 
            Cs.KitapCRUD kitapCRUD = new Cs.KitapCRUD();

            kitap.Isbn = TextBox1.Text;
            kitap.Ad = TextBox2.Text;
            kitap.Yazarno = Convert.ToInt16(DropDownList1.SelectedValue);
            kitap.Turno = Convert.ToInt16(DropDownList2.SelectedValue);
            kitap.Sayfa = Convert.ToInt16(TextBox3.Text);
            kitap.Puan = Convert.ToInt16(TextBox4.Text);
            //C: \Users\salih\Documents\old - repos -for-github\BLibraryPortal\butgem_kutuphane\yetkili\kitapresim\


        string kitapresim = FileUpload1.FileName;
            string kitapresimtarih = System.DateTime.Now.ToString("MMddyyyy_HHmmss");
            FileUpload1.SaveAs(Server.MapPath("kitapresim/" + kitapresimtarih + "_" + kitapresim));

            kitap.Resim = "kitapresim/" + kitapresimtarih + "_" + kitapresim;

            bool cevap = kitapCRUD.ekle(kitap);

            if (cevap == true)
            {
                kayitbasarili.Visible = true;
            }
            else
            {
                kayithatali.Visible = true;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Cs.Droplist droplist1 = new Cs.Droplist();
            Cs.DroplistCRUD droplist1CRUD = new Cs.DroplistCRUD();

            droplist1.Yazarad = TextBox5.Text;
            droplist1.Yazarsoyad = TextBox6.Text;

            bool cevap = droplist1CRUD.yazarekle(droplist1);

            if (cevap == true)
            {
                kayitbasarili.Visible = false;
                yturkayit.Visible = false;
                yyazarkayit.Visible = true;
            }
            else
            {
                kayithatali.Visible = true;
            }
            
            Cs.KitapCRUD ylistele0 = new Cs.KitapCRUD();
            DataTable yazardt = ylistele0.yazarliste();
            DropDownList1.DataValueField = "y_no";
            DropDownList1.DataTextField = "yazar_adi";

            DropDownList1.DataSource = yazardt;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Cs.Droplist droplist2 = new Cs.Droplist();
            Cs.DroplistCRUD droplist2CRUD = new Cs.DroplistCRUD();

            droplist2.Turad = TextBox7.Text;

            bool cevap = droplist2CRUD.turekle(droplist2);

            if (cevap == true)
            {
                kayitbasarili.Visible = false;
                yyazarkayit.Visible = false;
                yturkayit.Visible = true;
            }
            else
            {
                kayithatali.Visible = true;
            }
            
            Cs.KitapCRUD tlistele1 = new Cs.KitapCRUD();
            DataTable turdt = tlistele1.turliste();
            DropDownList2.DataValueField = "t_no";
            DropDownList2.DataTextField = "t_ad";

            DropDownList2.DataSource = turdt;
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
        }
    }
}