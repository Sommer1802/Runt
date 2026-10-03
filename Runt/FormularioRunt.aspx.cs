using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Runt
{
    public partial class FormularioRunt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Page.Validate("grpSolicitud");
            if (!Page.IsValid)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Revise los campos marcados con *.";
                return;
            }

            string placa = (txtLetras.Text + txtNumeros.Text).Trim().ToUpper();

            try
            {
                // 1. Propietario
                GuardarPersona(ddlTipoDocProp.SelectedValue, txtDocProp.Text, txtApe1Prop.Text,
                    txtApe2Prop.Text, txtNombresProp.Text, txtDirProp.Text,
                    txtCiudadProp.Text, txtTelProp.Text);

                // 2. Comprador (solo si se escribió su documento, por ejemplo en un traspaso)
                if (txtDocComp.Text.Trim() != "")
                {
                    GuardarPersona(ddlTipoDocComp.SelectedValue, txtDocComp.Text, txtApe1Comp.Text,
                        txtApe2Comp.Text, txtNombresComp.Text, txtDirComp.Text,
                        txtCiudadComp.Text, txtTelComp.Text);
                }

                // 3. Vehículo
                sdsVehiculo.InsertParameters["Placa"].DefaultValue = placa;
                sdsVehiculo.InsertParameters["IdClase"].DefaultValue = ddlClase.SelectedValue;
                sdsVehiculo.InsertParameters["IdMarca"].DefaultValue = ddlMarca.SelectedValue;
                sdsVehiculo.InsertParameters["IdLinea"].DefaultValue = ddlLinea.SelectedValue;
                sdsVehiculo.InsertParameters["IdCombustible"].DefaultValue = ddlCombustible.SelectedValue;
                sdsVehiculo.InsertParameters["Colores"].DefaultValue = txtColores.Text;
                sdsVehiculo.InsertParameters["Modelo"].DefaultValue = txtModelo.Text;
                sdsVehiculo.InsertParameters["Cilindrada"].DefaultValue = txtCilindrada.Text;
                sdsVehiculo.InsertParameters["Capacidad"].DefaultValue = txtCapacidad.Text;
                sdsVehiculo.InsertParameters["Blindaje"].DefaultValue = chkBlindaje.Checked.ToString();
                sdsVehiculo.InsertParameters["ResolucionBlindaje"].DefaultValue = txtResBlindaje.Text;
                sdsVehiculo.InsertParameters["DesmonteBlindaje"].DefaultValue = chkDesmonte.Checked.ToString();
                sdsVehiculo.InsertParameters["ResolucionDesmonte"].DefaultValue = txtResDesmonte.Text;
                sdsVehiculo.InsertParameters["PotenciaHP"].DefaultValue = txtPotencia.Text;
                sdsVehiculo.InsertParameters["IdCarroceria"].DefaultValue = ddlCarroceria.SelectedValue;
                sdsVehiculo.InsertParameters["NumeroMotor"].DefaultValue = txtMotor.Text;
                sdsVehiculo.InsertParameters["MotorRegrabado"].DefaultValue = chkMotorRegrabado.Checked.ToString();
                sdsVehiculo.InsertParameters["NumeroChasis"].DefaultValue = txtChasis.Text;
                sdsVehiculo.InsertParameters["ChasisRegrabado"].DefaultValue = chkChasisRegrabado.Checked.ToString();
                sdsVehiculo.InsertParameters["NumeroSerie"].DefaultValue = txtSerie.Text;
                sdsVehiculo.InsertParameters["SerieRegrabado"].DefaultValue = chkSerieRegrabado.Checked.ToString();
                sdsVehiculo.InsertParameters["NumeroVin"].DefaultValue = txtVin.Text;
                sdsVehiculo.InsertParameters["DocImportacion"].DefaultValue = ddlDocImportacion.SelectedValue;
                sdsVehiculo.InsertParameters["RemateEntidad"].DefaultValue = txtRemateEntidad.Text;
                sdsVehiculo.InsertParameters["RemateCiudad"].DefaultValue = txtRemateCiudad.Text;
                sdsVehiculo.InsertParameters["RemateCodigo"].DefaultValue = txtRemateCodigo.Text;
                sdsVehiculo.InsertParameters["NumeroDocumento"].DefaultValue = txtNumDocumento.Text;
                sdsVehiculo.InsertParameters["FechaDocumento"].DefaultValue = txtFechaDocumento.Text;
                sdsVehiculo.InsertParameters["IdServicio"].DefaultValue = ddlServicio.SelectedValue;
                sdsVehiculo.InsertParameters["EmpresaNombre"].DefaultValue = txtEmpresaNombre.Text;
                sdsVehiculo.InsertParameters["EmpresaNit"].DefaultValue = txtEmpresaNit.Text;
                sdsVehiculo.InsertParameters["IdAlerta"].DefaultValue = ddlAlerta.SelectedValue;
                sdsVehiculo.InsertParameters["AlertaAFavorDe"].DefaultValue = txtAFavorDe.Text;
                sdsVehiculo.Insert();

                // 4. Solicitud
                sdsSolicitud.InsertParameters["Placa"].DefaultValue = placa;
                sdsSolicitud.InsertParameters["IdTramite"].DefaultValue = ddlTramite.SelectedValue;
                sdsSolicitud.InsertParameters["IdPropietario"].DefaultValue = txtDocProp.Text.Trim();
                sdsSolicitud.InsertParameters["IdComprador"].DefaultValue = txtDocComp.Text.Trim();
                sdsSolicitud.InsertParameters["Observaciones"].DefaultValue = txtObservaciones.Text;
                sdsSolicitud.Insert();

                lblMensaje.ForeColor = System.Drawing.Color.Green;
                lblMensaje.Text = "Solicitud guardada correctamente.";
                gvSolicitudes.DataBind();
            }
            catch (Exception)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "No se pudo guardar. Revise que los campos obligatorios estén completos.";
            }
        }

        // Inserta una persona (propietario o comprador). Si el documento ya existe, no la repite.
        private void GuardarPersona(string tipoDoc, string documento, string apellido1,
            string apellido2, string nombres, string direccion, string ciudad, string telefono)
        {
            sdsPersona.InsertParameters["NumeroDocumento"].DefaultValue = documento.Trim();
            sdsPersona.InsertParameters["CodigoTipoDoc"].DefaultValue = tipoDoc;
            sdsPersona.InsertParameters["PrimerApellido"].DefaultValue = apellido1;
            sdsPersona.InsertParameters["SegundoApellido"].DefaultValue = apellido2;
            sdsPersona.InsertParameters["Nombres"].DefaultValue = nombres;
            sdsPersona.InsertParameters["Direccion"].DefaultValue = direccion;
            sdsPersona.InsertParameters["Ciudad"].DefaultValue = ciudad;
            sdsPersona.InsertParameters["Telefono"].DefaultValue = telefono;
            sdsPersona.Insert();
        }

        protected void gvSolicitudes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (Control c in e.Row.Cells[0].Controls)
                {
                    LinkButton boton = c as LinkButton;
                    if (boton != null && boton.CommandName == "Delete")
                    {
                        boton.OnClientClick = "return confirm('¿Desea eliminar esta solicitud?');";
                    }
                }
            }
        }
    }
}