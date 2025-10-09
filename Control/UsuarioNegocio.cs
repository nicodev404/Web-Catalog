using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Win32;
using Model;

namespace Control
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedLoguearUsuario");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.Email = (string)datos.Lector["email"];
                    usuario.Pass = (string)datos.Lector["pass"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["urlimagenperfil"] is DBNull))
                        usuario.URLImagenPerfil = (string)datos.Lector["urlimagenperfil"];
                    usuario.TipoUsuario = Convert.ToBoolean(datos.Lector["admin"]) == true ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int insertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedInsertarUsuario");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Actualizar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update USERS set Nombre = @nombre, Apellido = @apellido, UrlImagenPerfil = @imagen Where Id = @id");
                datos.setearParametro("@imagen", (object)usuario.URLImagenPerfil ?? DBNull.Value);
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@id", usuario.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
