<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="RedCoSite.LoginPage" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="Css/Estilo.css" rel="stylesheet" runat="server"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    
      <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <h2>PORTAL DE COMBUSTIBLES REDCO</h2>
                <img id="profile-img" class="profile-img-card" src="Image/RedPacifico.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputUsuario" class="form-control" runat="server" placeholder="Usuario" required autofocus style="margin-bottom:5px">
                <input type="password" id="inputPassword" runat="server" class="form-control" placeholder="Contrasena" required style="margin-bottom:5px">
                
                <dx:ASPxButton runat="server" ID="BtnLogin" OnClick="BtnLogin_Click" Text="Login" class="btn btn-lg btn-primary btn-block btn-signin" Theme="iOS" Width="100%"></dx:ASPxButton>
               <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModal">
                Launch demo modal
            </button>  
            
            </form><!-- /form -->
            <a href="#" class="forgot-password">
              Olvido su Contrasena?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
    <!-- Modal -->
<div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Mensaje</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblMessage" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Aceptar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
</asp:Content>
