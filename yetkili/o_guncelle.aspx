<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="o_guncelle.aspx.cs" Inherits="BLibraryPortal.yetkili.o_guncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="main-container">
		<div class="pd-ltr-20">
	
	
			<div class="page-header">
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="title">
							<h4><a href="index.aspx">Anasayfa</a></h4>
						</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item" aria-current="page">Okuyucu</li>
									<li class="breadcrumb-item active"><a href="o_ekle.aspx">Okuyucu Güncelleme</a></li>
								</ol>
							</nav>				
					</div>					
				</div>
			</div>			

					<div id="kayitbasarili" runat="server" class="alert alert-success alert-dismissible fade show" role="alert" visible="false">
							<strong>Başarılı işlem!</strong> Girilen bilgiler kaydedilmiştir.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
						</div>

					<div id="kayithatali" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert" visible="false">
							<strong>Hatalı işlem!</strong> Kayıt sırasında bir hata oluştu işlemi daha sonra tekrar deneyin.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
						</div>
					
					<div id="tchata" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert" visible="false">
							<strong>Hatalı işlem!</strong> TC kimlik numarası zaten kullanımda.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
						</div>

				<div class="pd-20 card-box mb-30">

					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Okuyucu güncelleme ekranı</h4>
							<p class="mb-30">Okuyucu bilgilerini lütfen doğru giriniz.</p>
						</div>
						
					</div>
		
					<form>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">TC Kimlik Numarası</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" Enabled="false"></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="TC Kimlik numarası alanı boş bırakılamaz." ControlToValidate="TextBox1" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Ünvan</label>
							
							<div class="col-sm-6 col-md-5">					
								<asp:DropDownList ID="DropDownList1" runat="server" class="custom-select col-12" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>									
							</div>
						
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ünvan alanı boş bırakılamaz." ControlToValidate="DropDownList1" Font-Size="Small" ForeColor="#EF5A5A" InitialValue="Lütfen seçim yapınız"></asp:RequiredFieldValidator>
							</div>
						</div>

				<asp:Panel ID="Panel1" runat="server" Visible="False">

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Öğrenci numarası</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox2" runat="server" class="form-control" type="text" placeholder="1111" maxlength="4"></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Öğrenci numarası alanı boş bırakılamaz." ControlToValidate="TextBox2" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Sınıf</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" placeholder="Örnek: 11/A"></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Sınıf alanı boş bırakılamaz." ControlToValidate="TextBox3" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

				</asp:Panel>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Ad</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox4" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ad alanı boş bırakılamaz." ControlToValidate="TextBox4" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Soyad</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox5" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Soyad alanı boş bırakılamaz." ControlToValidate="TextBox5" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>					

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Cinsiyet</label>

							<div class="col-sm-6 col-md-5 col-form-label">	
							<asp:RadioButton ID="RadioButton1" runat="server" Text=" Kadın" GroupName="cinsiyet"/>
							<asp:RadioButton ID="RadioButton2" runat="server" Text=" Erkek" GroupName="cinsiyet"/>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Telefon numarası</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox6" runat="server" class="form-control" type="text" placeholder="0500000000"></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Telefon numarası alanı boş bırakılamaz." ControlToValidate="TextBox6" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Doğum tarihi</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox7" runat="server" class="form-control date-picker" type="text" placeholder="Lütfen tarih seçimi yapın"></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Doğum tarihi alanı boş bırakılamaz." ControlToValidate="TextBox6" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Puan</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox8" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Puan alanı boş bırakılamaz." ControlToValidate="TextBox7" Font-Size="Small" ForeColor="#EF5A5A"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<div class="col-sm-6 col-md-5">	
								<asp:Button ID="Button1" runat="server" Text="Güncelle" class="btn btn-warning" OnClick="Button1_Click"/>
								<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
							</div>															
						</div>

						<%--<div class="modal fade" id="tchataModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">TC kimlik numarası kullanımda</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								  <span aria-hidden="true">&times;</span>
								</button>
							  </div>
							  <div class="modal-body">
								Lütfen bilgilerinizi güncelleyin
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							  </div>
							</div>
						  </div>
						</div>--%>										

					</form>

				</div>
			</div>
		</div>

</asp:Content>
