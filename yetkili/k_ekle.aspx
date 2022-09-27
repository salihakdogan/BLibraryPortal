<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="k_ekle.aspx.cs" Inherits="BLibraryPortal.yetkili.k_ekle" %>
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
									<li class="breadcrumb-item" aria-current="page">Kitap</li>
									<li class="breadcrumb-item active"><a href="k_ekle.aspx">Kitap Ekle</a></li>
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
					
					<div id="yyazarkayit" runat="server" class="alert alert-success alert-dismissible fade show" role="alert" visible="false">
									<strong>Başarılı işlem!</strong> Yeni girilen yazar bilgileri kaydedilmiştir.
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									 <span aria-hidden="true">&times;</span>
								</button>
								</div>

					<div id="yturkayit" runat="server" class="alert alert-success alert-dismissible fade show" role="alert" visible="false">
									<strong>Başarılı işlem!</strong> Yeni girilen tür bilgileri kaydedilmiştir.
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									 <span aria-hidden="true">&times;</span>
								</button>
								</div>

					

				<div class="pd-20 card-box mb-30">

					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Kitap ekleme ekranı</h4>
							<p class="mb-30">Kitap bilgilerini lütfen doğru giriniz.</p>
						</div>
						
					</div>

					<form>
														
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">ISBN numarası</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ISBN numarası alanı boş bırakılamaz." ControlToValidate="TextBox1" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Kitap adı</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox2" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
						
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Kitap adı alanı boş bırakılamaz." ControlToValidate="TextBox2" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Yazar adı</label>
							
							<div class="col-sm-6 col-md-5">					
								<asp:DropDownList ID="DropDownList1" runat="server" class="custom-select col-8"></asp:DropDownList>									
								<asp:Label ID="Label2" runat="server" Text="Yeni yazar ekle" class="btn btn-primary col-4-form-label" data-toggle="modal" data-target="#y_yazar_ekle" causesvalidation="false"></asp:Label>
								
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Yazar alanı boş bırakılamaz." Font-Size="Small" ForeColor="#EF5A5A" ControlToValidate="DropDownList1" InitialValue="0" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Kitap türü</label>												

							<div class="col-sm-6 col-md-5">					
								<asp:DropDownList ID="DropDownList2" runat="server" class="custom-select col-8"></asp:DropDownList>								
								<asp:Label ID="Label3" runat="server" Text="Yeni tür ekle" class="btn btn-primary col-4-form-label" data-toggle="modal" data-target="#y_tur_ekle" causesvalidation="false"></asp:Label>
								
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Kitap türü alanı boş bırakılamaz." ControlToValidate="DropDownList2" Font-Size="Small" ForeColor="#EF5A5A" InitialValue="0" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Sayfa sayısı</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Sayfa sayısı alanı boş bırakılamaz." ControlToValidate="TextBox3" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Kitap puanı</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox4" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Kitap puanı alanı boş bırakılamaz." ControlToValidate="TextBox4" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>
						
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Kitap resmi</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Resim seçimi alanı boş bırakılamaz." ControlToValidate="FileUpload1" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>	

						<div class="form-group row">
							<div class="col-sm-6 col-md-5">	
								<asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="kitapkayit" />
								<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
							</div>															
						</div>

					<%--yazar ekle modal başlangıç--%>	
							
							<div class="modal fade bs-example-modal-lg" id="y_yazar_ekle" tabindex="-1" role="form" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="y_yazar_ekle">Yeni yazar ekle</h4>
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										</div>
										<div class="modal-body">																				

												<div class="form-group row">
													<label class="col-sm-12 col-md-2 col-form-label">Yazar Adı</label>
							
													<div class="col-sm-6 col-md-5">								
														<asp:TextBox ID="TextBox5" runat="server" class="form-control" type="text"></asp:TextBox>
													</div>
							
													<div class="col-sm-6 col-md-5 col-form-label">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Yazar adı alanı boş bırakılamaz." ControlToValidate="TextBox5" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="yazarkayit"></asp:RequiredFieldValidator>
													</div>														
												</div>

												<div class="form-group row">
													<label class="col-sm-12 col-md-2 col-form-label">Yazar Soyadı</label>
							
													<div class="col-sm-6 col-md-5">								
														<asp:TextBox ID="TextBox6" runat="server" class="form-control" type="text"></asp:TextBox>
													</div>
							
													<div class="col-sm-6 col-md-5 col-form-label">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Yazar soyadı alanı boş bırakılamaz." ControlToValidate="TextBox6" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="yazarkayit" ></asp:RequiredFieldValidator>
													</div>														
												</div>


										</div>
										<div class="modal-footer">
											<asp:Button ID="Button4" runat="server" Text="İptal" class="btn btn-secondary" data-dismiss="modal"/>
											<asp:Button ID="Button5" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="Button5_Click" ValidationGroup="yazarkayit"/>
											
										</div>
									</div>
								</div>
							</div>
					
					<%--yazar ekle modal bitiş--%>


					<%--tür ekle modal başlangıç--%>	
					
							<div class="modal fade bs-example-modal-lg" id="y_tur_ekle" tabindex="-1" role="form" aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="y_tur_ekle">Yeni tür ekle</h4>
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												</div>
												<div class="modal-body">																				

														<div class="form-group row">
															<label class="col-sm-12 col-md-2 col-form-label">Tür Adı</label>
							
															<div class="col-sm-6 col-md-5">								
																<asp:TextBox ID="TextBox7" runat="server" class="form-control" type="text"></asp:TextBox>
															</div>
							
															<div class="col-sm-6 col-md-5 col-form-label">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Tür adı alanı boş bırakılamaz." ControlToValidate="TextBox7" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="turkayit"></asp:RequiredFieldValidator>
															</div>														
														</div>							

												</div>
												<div class="modal-footer">
													
													<asp:Button ID="Button6" runat="server" Text="İptal" class="btn btn-secondary" data-dismiss="modal" />													
													<asp:Button ID="Button7" runat="server" Text="Kaydet" class="btn btn-primary" OnClick="Button7_Click" ValidationGroup="turkayit"/>
												</div>
											</div>
										</div>
									</div>

					<%--tür ekle modal bitiş--%>

					</form>
				</div>
			</div>
		</div>

</asp:Content>


