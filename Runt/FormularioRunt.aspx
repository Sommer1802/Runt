<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioRunt.aspx.cs" Inherits="Runt.FormularioRunt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Formulario RUNT</title>
    <link href="Estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Formulario de solicitud de trámites del Registro Nacional Automotor</h2>

<%-- 2. Placa --%>
    <asp:Label ID="lblPlaca" runat="server" Text="2. Placa"></asp:Label>
    <br />
    <asp:Label ID="lblLetras" runat="server" Text="Letras"></asp:Label>
    <asp:TextBox ID="txtLetras" runat="server" MaxLength="3" Width="50px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvLetras" runat="server" ControlToValidate="txtLetras" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revLetras" runat="server" ControlToValidate="txtLetras" ValidationExpression="^[A-Za-z]{3}$" Text="*" ToolTip="Deben ser 3 letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
    <asp:Label ID="lblNumeros" runat="server" Text="Números"></asp:Label>
    <asp:TextBox ID="txtNumeros" runat="server" MaxLength="3" Width="50px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNumeros" runat="server" ControlToValidate="txtNumeros" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revNumeros" runat="server" ControlToValidate="txtNumeros" ValidationExpression="^[0-9]{3}$" Text="*" ToolTip="Deben ser 3 números" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
    <br /><br />

<%-- 3. Trámite solicitado --%>
     <asp:Label ID="lblTramite" runat="server" Text="3. Trámite solicitado"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlTramite" runat="server"
        DataSourceID="sdsTramite"
        DataTextField="Nombre"
        DataValueField="IdTramite">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sdsTramite" runat="server"
     ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
        SelectCommand="SELECT IdTramite, Nombre FROM Tramite ORDER BY IdTramite">
    </asp:SqlDataSource>
    <br /><br />

<%-- 4. Clase de vehículo --%>
<asp:Label ID="lblClase" runat="server" Text="4. Clase de vehículo"></asp:Label>
<br />
<asp:DropDownList ID="ddlClase" runat="server"
    DataSourceID="sdsClase"
    DataTextField="Nombre"
    DataValueField="IdClase">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsClase" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdClase, Nombre FROM ClaseVehiculo ORDER BY IdClase">
</asp:SqlDataSource>
            <br /><br />
<h3>Datos del vehículo</h3>

<%-- 5. Marca --%>
<asp:Label ID="lblMarca" runat="server" Text="5. Marca"></asp:Label>
<br />
<asp:DropDownList ID="ddlMarca" runat="server"
    AutoPostBack="True"
    DataSourceID="sdsMarca"
    DataTextField="Nombre"
    DataValueField="IdMarca">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsMarca" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdMarca, Nombre FROM Marca ORDER BY Nombre">
</asp:SqlDataSource>
<br /><br />

<%-- 6. Línea (depende de la marca elegida) --%>
<asp:Label ID="lblLinea" runat="server" Text="6. Línea"></asp:Label>
<br />
<asp:DropDownList ID="ddlLinea" runat="server"
    DataSourceID="sdsLinea"
    DataTextField="Nombre"
    DataValueField="IdLinea">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsLinea" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdLinea, Nombre FROM Linea WHERE IdMarca = @IdMarca ORDER BY Nombre">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlMarca" Name="IdMarca"
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<br /><br />

<%-- 7. Combustible --%>
<asp:Label ID="lblCombustible" runat="server" Text="7. Combustible"></asp:Label>
<br />
<asp:DropDownList ID="ddlCombustible" runat="server"
    DataSourceID="sdsCombustible"
    DataTextField="Nombre"
    DataValueField="IdCombustible">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsCombustible" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdCombustible, Nombre FROM Combustible ORDER BY IdCombustible">
</asp:SqlDataSource>
<br /><br />

<%-- 8. Colores (máximo tres) --%>
<asp:Label ID="lblColores" runat="server" Text="8. Colores (máximo tres)"></asp:Label>
<br />
<asp:TextBox ID="txtColores" runat="server" MaxLength="60" Width="250px"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvColores" runat="server" ControlToValidate="txtColores" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<br /><br />

<%-- 9. Modelo --%>
<asp:Label ID="lblModelo" runat="server" Text="9. Modelo (año)"></asp:Label>
<br />
<asp:TextBox ID="txtModelo" runat="server" MaxLength="4" Width="80px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revModelo" runat="server" ControlToValidate="txtModelo" ValidationExpression="^(19|20)[0-9]{2}$" Text="*" ToolTip="Año de 4 dígitos, por ejemplo 2019" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvModelo" runat="server" ControlToValidate="txtModelo" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="cvModelo" runat="server" ControlToValidate="txtModelo" Operator="DataTypeCheck" Type="Integer" Text="*" ToolTip="Debe ser un número entero" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:CompareValidator>
<br /><br />

<%-- 10. Cilindrada --%>
<asp:Label ID="lblCilindrada" runat="server" Text="10. Cilindrada"></asp:Label>
<br />
<asp:TextBox ID="txtCilindrada" runat="server" Width="80px"></asp:TextBox>
<asp:CompareValidator ID="cvCilindrada" runat="server" ControlToValidate="txtCilindrada" Operator="DataTypeCheck" Type="Integer" Text="*" ToolTip="Debe ser un número entero" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:CompareValidator>
<br /><br />

<%-- 11. Capacidad --%>
<asp:Label ID="lblCapacidad" runat="server" Text="11. Capacidad (Kg / Psj.)"></asp:Label>
<br />
<asp:TextBox ID="txtCapacidad" runat="server" Width="80px"></asp:TextBox>
<asp:CompareValidator ID="cvCapacidad" runat="server" ControlToValidate="txtCapacidad" Operator="DataTypeCheck" Type="Integer" Text="*" ToolTip="Debe ser un número entero" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:CompareValidator>
<br /><br />

<%-- 14. Potencia --%>
<asp:Label ID="lblPotencia" runat="server" Text="14. Potencia (HP)"></asp:Label>
<br />
<asp:TextBox ID="txtPotencia" runat="server" Width="80px"></asp:TextBox>
<asp:CompareValidator ID="cvPotencia" runat="server" ControlToValidate="txtPotencia" Operator="DataTypeCheck" Type="Integer" Text="*" ToolTip="Debe ser un número entero" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:CompareValidator>

            <br /><br />
<h3>Blindaje, carrocería e identificación interna</h3>

<%-- 12. Blindaje --%>
<asp:CheckBox ID="chkBlindaje" runat="server" Text="12. Blindaje" />
<br />
<asp:Label ID="lblResBlindaje" runat="server" Text="Resolución No. (DD/MM/AÑO)"></asp:Label>
<asp:TextBox ID="txtResBlindaje" runat="server" MaxLength="30" Width="150px"></asp:TextBox>
<br /><br />

<%-- 13. Desmonte de blindaje --%>
<asp:CheckBox ID="chkDesmonte" runat="server" Text="13. Desmonte de blindaje" />
<br />
<asp:Label ID="lblResDesmonte" runat="server" Text="Resolución No. (DD/MM/AÑO)"></asp:Label>
<asp:TextBox ID="txtResDesmonte" runat="server" MaxLength="30" Width="150px"></asp:TextBox>
<br /><br />

<%-- 15. Carrocería --%>
<asp:Label ID="lblCarroceria" runat="server" Text="15. Carrocería"></asp:Label>
<br />
<asp:DropDownList ID="ddlCarroceria" runat="server"
    DataSourceID="sdsCarroceria"
    DataTextField="Tipo"
    DataValueField="IdCarroceria">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsCarroceria" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdCarroceria, Tipo FROM Carroceria ORDER BY IdCarroceria">
</asp:SqlDataSource>
<br /><br />

<%-- 16. Identificación interna del vehículo --%>
<asp:Label ID="lblIdentificacion" runat="server" Text="16. Identificación interna del vehículo"></asp:Label>
<br /><br />

<asp:Label ID="lblMotor" runat="server" Text="No. de motor"></asp:Label>
<asp:TextBox ID="txtMotor" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvMotor" runat="server" ControlToValidate="txtMotor" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:CheckBox ID="chkMotorRegrabado" runat="server" Text="Regrabado" />
<br />

<asp:Label ID="lblChasis" runat="server" Text="No. de chasis"></asp:Label>
<asp:TextBox ID="txtChasis" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvChasis" runat="server" ControlToValidate="txtChasis" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:CheckBox ID="chkChasisRegrabado" runat="server" Text="Regrabado" />
<br />

<asp:Label ID="lblSerie" runat="server" Text="No. de serie"></asp:Label>
<asp:TextBox ID="txtSerie" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
<asp:CheckBox ID="chkSerieRegrabado" runat="server" Text="Regrabado" />
<br />

<asp:Label ID="lblVin" runat="server" Text="No. de VIN (vehículos automotores)"></asp:Label>
<asp:TextBox ID="txtVin" runat="server" MaxLength="30" Width="200px"></asp:TextBox>

            <br /><br />
<h3>Importación o remate, servicio y alerta</h3>

<%-- 17. Importación o remate --%>
<asp:Label ID="lblImportacion" runat="server" Text="17. Importación o remate"></asp:Label>
<br /><br />

<asp:Label ID="lblDocImportacion" runat="server" Text="Documento de importación"></asp:Label>
<asp:DropDownList ID="ddlDocImportacion" runat="server">
    <asp:ListItem Value="">(Ninguno)</asp:ListItem>
    <asp:ListItem Value="1">Manifiesto o acta</asp:ListItem>
    <asp:ListItem Value="2">Declaración de importación</asp:ListItem>
    <asp:ListItem Value="3">Acta</asp:ListItem>
</asp:DropDownList>
<br />

<asp:Label ID="lblRemateEntidad" runat="server" Text="Remate: entidad"></asp:Label>
<asp:TextBox ID="txtRemateEntidad" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
<br />

<asp:Label ID="lblRemateCiudad" runat="server" Text="Remate: lugar (ciudad)"></asp:Label>
<asp:TextBox ID="txtRemateCiudad" runat="server" MaxLength="40" Width="150px"></asp:TextBox>
<br />

<asp:Label ID="lblRemateCodigo" runat="server" Text="Remate: código"></asp:Label>
<asp:TextBox ID="txtRemateCodigo" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
<br />

<asp:Label ID="lblNumDocumento" runat="server" Text="No. documento"></asp:Label>
<asp:TextBox ID="txtNumDocumento" runat="server" MaxLength="20" Width="150px"></asp:TextBox>
<br />

<asp:Label ID="lblFechaDocumento" runat="server" Text="Fecha (DD/MM/AAAA)"></asp:Label>
<asp:TextBox ID="txtFechaDocumento" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revFechaDocumento" runat="server" ControlToValidate="txtFechaDocumento" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$" Text="*" ToolTip="Formato DD/MM/AAAA" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<br /><br />

<%-- 18. Tipo de servicio --%>
<asp:Label ID="lblServicio" runat="server" Text="18. Tipo de servicio"></asp:Label>
<br />
<asp:DropDownList ID="ddlServicio" runat="server"
    DataSourceID="sdsServicio"
    DataTextField="Nombre"
    DataValueField="IdServicio">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsServicio" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdServicio, Nombre FROM TipoServicio ORDER BY IdServicio">
</asp:SqlDataSource>
<br /><br />

<%-- 19. Empresa vinculadora --%>
<asp:Label ID="lblEmpresa" runat="server" Text="19. Empresa vinculadora"></asp:Label>
<br />
<asp:Label ID="lblEmpresaNombre" runat="server" Text="Nombre"></asp:Label>
<asp:TextBox ID="txtEmpresaNombre" runat="server" MaxLength="60" Width="250px"></asp:TextBox>
<asp:Label ID="lblEmpresaNit" runat="server" Text="NIT"></asp:Label>
<asp:TextBox ID="txtEmpresaNit" runat="server" MaxLength="15" Width="120px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revEmpresaNit" runat="server" ControlToValidate="txtEmpresaNit" ValidationExpression="^[0-9-]{5,15}$" Text="*" ToolTip="Solo números y guion" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<br /><br />

<%-- 20. Datos de alerta --%>
<asp:Label ID="lblAlerta" runat="server" Text="20. Datos de alerta"></asp:Label>
<br />
<asp:DropDownList ID="ddlAlerta" runat="server"
    AppendDataBoundItems="True"
    DataSourceID="sdsAlerta"
    DataTextField="Nombre"
    DataValueField="IdAlerta">
    <asp:ListItem Value="">(Sin alerta)</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="sdsAlerta" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT IdAlerta, Nombre FROM TipoAlerta ORDER BY IdAlerta">
</asp:SqlDataSource>
<br />
<asp:Label ID="lblAFavorDe" runat="server" Text="A favor de"></asp:Label>
<asp:TextBox ID="txtAFavorDe" runat="server" MaxLength="60" Width="250px"></asp:TextBox>

            <br /><br />
<h3>21. Datos del propietario</h3>

<asp:Label ID="lblTipoDocProp" runat="server" Text="Tipo de documento"></asp:Label>
<asp:DropDownList ID="ddlTipoDocProp" runat="server"
    DataSourceID="sdsTipoDoc" DataTextField="Nombre" DataValueField="Codigo">
</asp:DropDownList>
<asp:Label ID="lblDocProp" runat="server" Text="No. documento"></asp:Label>
<asp:TextBox ID="txtDocProp" runat="server" MaxLength="20" Width="130px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revDocProp" runat="server" ControlToValidate="txtDocProp" ValidationExpression="^[A-Za-z0-9]{5,20}$" Text="*" ToolTip="Entre 5 y 20 letras o números" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvDocProp" runat="server" ControlToValidate="txtDocProp" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<br />
<asp:Label ID="lblApe1Prop" runat="server" Text="Primer apellido"></asp:Label>
<asp:TextBox ID="txtApe1Prop" runat="server" MaxLength="40"></asp:TextBox>
<asp:RegularExpressionValidator ID="revApe1Prop" runat="server" ControlToValidate="txtApe1Prop" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvApe1Prop" runat="server" ControlToValidate="txtApe1Prop" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:Label ID="lblApe2Prop" runat="server" Text="Segundo apellido"></asp:Label>
<asp:TextBox ID="txtApe2Prop" runat="server" MaxLength="40"></asp:TextBox>
<asp:RegularExpressionValidator ID="revApe2Prop" runat="server" ControlToValidate="txtApe2Prop" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:Label ID="lblNombresProp" runat="server" Text="Nombres"></asp:Label>
<asp:TextBox ID="txtNombresProp" runat="server" MaxLength="60"></asp:TextBox>
<asp:RegularExpressionValidator ID="revNombresProp" runat="server" ControlToValidate="txtNombresProp" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvNombresProp" runat="server" ControlToValidate="txtNombresProp" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<br />
<asp:Label ID="lblDirProp" runat="server" Text="Dirección"></asp:Label>
<asp:TextBox ID="txtDirProp" runat="server" MaxLength="80" Width="250px"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvDirProp" runat="server" ControlToValidate="txtDirProp" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:Label ID="lblCiudadProp" runat="server" Text="Ciudad"></asp:Label>
<asp:TextBox ID="txtCiudadProp" runat="server" MaxLength="40"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvCiudadProp" runat="server" ControlToValidate="txtCiudadProp" Text="*" ToolTip="Campo obligatorio" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RequiredFieldValidator>
<asp:Label ID="lblTelProp" runat="server" Text="Teléfono"></asp:Label>
<asp:TextBox ID="txtTelProp" runat="server" MaxLength="15" Width="110px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revTelProp" runat="server" ControlToValidate="txtTelProp" ValidationExpression="^[0-9]{7,10}$" Text="*" ToolTip="Entre 7 y 10 números" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<br /><br />

<h3>22. Datos del comprador (traspaso)</h3>

<asp:Label ID="lblTipoDocComp" runat="server" Text="Tipo de documento"></asp:Label>
<asp:DropDownList ID="ddlTipoDocComp" runat="server"
    DataSourceID="sdsTipoDoc" DataTextField="Nombre" DataValueField="Codigo">
</asp:DropDownList>
<asp:Label ID="lblDocComp" runat="server" Text="No. documento"></asp:Label>
<asp:TextBox ID="txtDocComp" runat="server" MaxLength="20" Width="130px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revDocComp" runat="server" ControlToValidate="txtDocComp" ValidationExpression="^[A-Za-z0-9]{5,20}$" Text="*" ToolTip="Entre 5 y 20 letras o números" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<br />
<asp:Label ID="lblApe1Comp" runat="server" Text="Primer apellido"></asp:Label>
<asp:TextBox ID="txtApe1Comp" runat="server" MaxLength="40"></asp:TextBox>
<asp:RegularExpressionValidator ID="revApe1Comp" runat="server" ControlToValidate="txtApe1Comp" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:Label ID="lblApe2Comp" runat="server" Text="Segundo apellido"></asp:Label>
<asp:TextBox ID="txtApe2Comp" runat="server" MaxLength="40"></asp:TextBox>
<asp:RegularExpressionValidator ID="revApe2Comp" runat="server" ControlToValidate="txtApe2Comp" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<asp:Label ID="lblNombresComp" runat="server" Text="Nombres"></asp:Label>
<asp:TextBox ID="txtNombresComp" runat="server" MaxLength="60"></asp:TextBox>
<asp:RegularExpressionValidator ID="revNombresComp" runat="server" ControlToValidate="txtNombresComp" ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+$" Text="*" ToolTip="Solo letras" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>
<br />
<asp:Label ID="lblDirComp" runat="server" Text="Dirección"></asp:Label>
<asp:TextBox ID="txtDirComp" runat="server" MaxLength="80" Width="250px"></asp:TextBox>
<asp:Label ID="lblCiudadComp" runat="server" Text="Ciudad"></asp:Label>
<asp:TextBox ID="txtCiudadComp" runat="server" MaxLength="40"></asp:TextBox>
<asp:Label ID="lblTelComp" runat="server" Text="Teléfono"></asp:Label>
<asp:TextBox ID="txtTelComp" runat="server" MaxLength="15" Width="110px"></asp:TextBox>
<asp:RegularExpressionValidator ID="revTelComp" runat="server" ControlToValidate="txtTelComp" ValidationExpression="^[0-9]{7,10}$" Text="*" ToolTip="Entre 7 y 10 números" ForeColor="Red" Display="Dynamic" ValidationGroup="grpSolicitud"></asp:RegularExpressionValidator>

<%-- Fuente de datos compartida por los dos tipos de documento --%>
<asp:SqlDataSource ID="sdsTipoDoc" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT Codigo, Nombre FROM TipoDocumento ORDER BY Codigo">
</asp:SqlDataSource>
<br /><br />

<%-- 23. Observaciones --%>
<h3>23. Observaciones</h3>
<asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine"
    Rows="4" Width="450px"></asp:TextBox>
<br /><br />

<%-- Guardar --%>
<asp:Button ID="btnGuardar" runat="server" Text="Guardar solicitud" OnClick="btnGuardar_Click" ValidationGroup="grpSolicitud" />
<br />
<asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>



<%-- Persona (se usa para el propietario y para el comprador) --%>
<asp:SqlDataSource ID="sdsPersona" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    InsertCommand="IF NOT EXISTS (SELECT 1 FROM Persona WHERE NumeroDocumento = @NumeroDocumento) INSERT INTO Persona (NumeroDocumento, CodigoTipoDoc, PrimerApellido, SegundoApellido, Nombres, Direccion, Ciudad, Telefono) VALUES (@NumeroDocumento, @CodigoTipoDoc, @PrimerApellido, @SegundoApellido, @Nombres, @Direccion, @Ciudad, @Telefono)">
    <InsertParameters>
        <asp:Parameter Name="NumeroDocumento" Type="String" />
        <asp:Parameter Name="CodigoTipoDoc" Type="String" />
        <asp:Parameter Name="PrimerApellido" Type="String" />
        <asp:Parameter Name="SegundoApellido" Type="String" />
        <asp:Parameter Name="Nombres" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Ciudad" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<%-- Vehículo --%>
<asp:SqlDataSource ID="sdsVehiculo" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    InsertCommand="IF NOT EXISTS (SELECT 1 FROM Vehiculo WHERE Placa = @Placa) INSERT INTO Vehiculo (Placa, IdClase, IdMarca, IdLinea, IdCombustible, Colores, Modelo, Cilindrada, Capacidad, Blindaje, ResolucionBlindaje, DesmonteBlindaje, ResolucionDesmonte, PotenciaHP, IdCarroceria, NumeroMotor, MotorRegrabado, NumeroChasis, ChasisRegrabado, NumeroSerie, SerieRegrabado, NumeroVin, DocImportacion, RemateEntidad, RemateCiudad, RemateCodigo, NumeroDocumento, FechaDocumento, IdServicio, EmpresaNombre, EmpresaNit, IdAlerta, AlertaAFavorDe) VALUES (@Placa, @IdClase, @IdMarca, @IdLinea, @IdCombustible, @Colores, @Modelo, @Cilindrada, @Capacidad, @Blindaje, @ResolucionBlindaje, @DesmonteBlindaje, @ResolucionDesmonte, @PotenciaHP, @IdCarroceria, @NumeroMotor, @MotorRegrabado, @NumeroChasis, @ChasisRegrabado, @NumeroSerie, @SerieRegrabado, @NumeroVin, @DocImportacion, @RemateEntidad, @RemateCiudad, @RemateCodigo, @NumeroDocumento, TRY_CONVERT(date, @FechaDocumento, 103), @IdServicio, @EmpresaNombre, @EmpresaNit, @IdAlerta, @AlertaAFavorDe)">
    <InsertParameters>
        <asp:Parameter Name="Placa" Type="String" />
        <asp:Parameter Name="IdClase" Type="Int32" />
        <asp:Parameter Name="IdMarca" Type="Int32" />
        <asp:Parameter Name="IdLinea" Type="Int32" />
        <asp:Parameter Name="IdCombustible" Type="Int32" />
        <asp:Parameter Name="Colores" Type="String" />
        <asp:Parameter Name="Modelo" Type="Int32" />
        <asp:Parameter Name="Cilindrada" Type="Int32" />
        <asp:Parameter Name="Capacidad" Type="Int32" />
        <asp:Parameter Name="Blindaje" Type="Boolean" />
        <asp:Parameter Name="ResolucionBlindaje" Type="String" />
        <asp:Parameter Name="DesmonteBlindaje" Type="Boolean" />
        <asp:Parameter Name="ResolucionDesmonte" Type="String" />
        <asp:Parameter Name="PotenciaHP" Type="Int32" />
        <asp:Parameter Name="IdCarroceria" Type="Int32" />
        <asp:Parameter Name="NumeroMotor" Type="String" />
        <asp:Parameter Name="MotorRegrabado" Type="Boolean" />
        <asp:Parameter Name="NumeroChasis" Type="String" />
        <asp:Parameter Name="ChasisRegrabado" Type="Boolean" />
        <asp:Parameter Name="NumeroSerie" Type="String" />
        <asp:Parameter Name="SerieRegrabado" Type="Boolean" />
        <asp:Parameter Name="NumeroVin" Type="String" />
        <asp:Parameter Name="DocImportacion" Type="Int32" />
        <asp:Parameter Name="RemateEntidad" Type="String" />
        <asp:Parameter Name="RemateCiudad" Type="String" />
        <asp:Parameter Name="RemateCodigo" Type="String" />
        <asp:Parameter Name="NumeroDocumento" Type="String" />
        <asp:Parameter Name="FechaDocumento" Type="String" />
        <asp:Parameter Name="IdServicio" Type="Int32" />
        <asp:Parameter Name="EmpresaNombre" Type="String" />
        <asp:Parameter Name="EmpresaNit" Type="String" />
        <asp:Parameter Name="IdAlerta" Type="Int32" />
        <asp:Parameter Name="AlertaAFavorDe" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<%-- Solicitud --%>
<asp:SqlDataSource ID="sdsSolicitud" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    InsertCommand="INSERT INTO Solicitud (Placa, IdTramite, IdPropietario, IdComprador, Observaciones) VALUES (@Placa, @IdTramite, @IdPropietario, @IdComprador, LEFT(@Observaciones, 300))">
    <InsertParameters>
        <asp:Parameter Name="Placa" Type="String" />
        <asp:Parameter Name="IdTramite" Type="Int32" />
        <asp:Parameter Name="IdPropietario" Type="String" />
        <asp:Parameter Name="IdComprador" Type="String" />
        <asp:Parameter Name="Observaciones" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<br /><br />

<%-- Consulta de solicitudes: selección, edición, eliminación, paginación y ordenación --%>
<h3>Solicitudes registradas</h3>
<asp:GridView ID="gvSolicitudes" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="IdSolicitud"
    DataSourceID="sdsSolicitudes"
    AllowPaging="True" PageSize="5"
    AllowSorting="True"
    OnRowDataBound="gvSolicitudes_RowDataBound">
    <Columns>
        <asp:CommandField ShowSelectButton="True" ShowEditButton="True" ShowDeleteButton="True"
            SelectText="Seleccionar" EditText="Editar" DeleteText="Eliminar"
            UpdateText="Actualizar" CancelText="Cancelar" />
        <asp:BoundField DataField="IdSolicitud" HeaderText="No." ReadOnly="True" SortExpression="IdSolicitud" />
        <asp:BoundField DataField="FechaTramite" HeaderText="Fecha" ReadOnly="True"
            SortExpression="FechaTramite" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
        <asp:BoundField DataField="Placa" HeaderText="Placa" ReadOnly="True" SortExpression="Placa" />
        <asp:BoundField DataField="Tramite" HeaderText="Trámite" ReadOnly="True" SortExpression="Tramite" />
        <asp:BoundField DataField="Propietario" HeaderText="Propietario" ReadOnly="True" SortExpression="Propietario" />
        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
    </Columns>
    <SelectedRowStyle BackColor="#DDEEFF" />
</asp:GridView>
<asp:SqlDataSource ID="sdsSolicitudes" runat="server"
    ConnectionString="<%$ ConnectionStrings:RUNTConnectionString %>"
    SelectCommand="SELECT s.IdSolicitud, s.FechaTramite, s.Placa, t.Nombre AS Tramite, p.PrimerApellido + ' ' + p.Nombres AS Propietario, s.Observaciones FROM Solicitud s INNER JOIN Tramite t ON s.IdTramite = t.IdTramite INNER JOIN Persona p ON s.IdPropietario = p.NumeroDocumento ORDER BY s.IdSolicitud DESC"
    UpdateCommand="UPDATE Solicitud SET Observaciones = @Observaciones WHERE IdSolicitud = @IdSolicitud"
    DeleteCommand="DELETE FROM Solicitud WHERE IdSolicitud = @IdSolicitud">
    <UpdateParameters>
        <asp:Parameter Name="Observaciones" Type="String" />
        <asp:Parameter Name="IdSolicitud" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="IdSolicitud" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
