<%@ Page Title="" Language="C#" MasterPageFile="~/Alumno/Alumno.Master" AutoEventWireup="true" CodeBehind="PrincipalAlumno.aspx.cs" Inherits="ProjectPaslum.Alumno.PrincipalAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image:url(images/ut6.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-8 text-center ftco-animate">
            <h1 class="mb-4">PASANDO AL FUTURO CON PASLUM <span>FACIL Y RAPIDO TU PASE DE LISTA</span></h1>
          </div>
        </div>
        </div>
      </div>
      <div class="slider-item" style="background-image:url(images/ut4.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-8 text-center ftco-animate">
            <h1 class="mb-4">PASE DE LISTA <span> PASLUM</span></h1>      
          </div>
        </div>
        </div>
      </div>
    </section>
    <section class="ftco-services ftco-no-pb">
			<div class="container-wrap">
				<div class="row no-gutters">
          <div class="col-md-3 d-flex services align-self-stretch pb-4 px-4 ftco-animate bg-primary">
            <div class="media block-6 d-block text-center">
              <div class="icon d-flex justify-content-center align-items-center button">
            		<span class="flaticon-teacher"></span>
              </div>
              <div class="media-body p-2 mt-3">   
                 <a href="DatosPersonales.aspx"><h3 class="heading">Datos Personales</h3></a>
                <p>Visualiza y actualiza tu informacion personal.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex services align-self-stretch pb-4 px-4 ftco-animate bg-tertiary">
            <div class="media block-6 d-block text-center">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="flaticon-reading"></span>
              </div>
              <div class="media-body p-2 mt-3">
                  <a href="ListaAsistencia.aspx"><h3 class="heading">Lista Asistecia</h3></a>
                <p>Consulta tu lista de asistencia de acuerdo a tu periodo escolar.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex services align-self-stretch pb-4 px-4 ftco-animate bg-fifth">
            <div class="media block-6 d-block text-center">
              <div class="icon d-flex justify-content-center alignitems-center">
            		<span class="flaticon-books"></span>
              </div>
              <div class="media-body p-2 mt-3">
                <a href="DatosEscolares.aspx"><h3 class="heading">Datos Escolares</h3></a>
                <p>Cosulta tus calificaciones y notas asignadas.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex services align-self-stretch pb-4 px-4 ftco-animate bg-quarternary">
            <div class="media block-6 d-block text-center">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="flaticon-diploma"></span>
              </div>
              <div class="media-body p-2 mt-3">
                <a href="Notas.aspx"><h3 class="heading">Notas</h3></a>
                <p>Visualizar notas importantes</p>
              </div>
            </div>      
          </div>
        </div>
		</div>
    </section>	
	<section class="ftco-intro" style="background-image: url(images/ut1.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<h2></h2>
						<p class="mb-0">Tecologia Nueva</p>
					</div>
				</div>
			</div>
		</section>
          <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.waypoints.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/scrollax.min.js"></script>
    <script src="../js/google-map.js"></script>
    <script src="../js/main.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
</asp:Content>

