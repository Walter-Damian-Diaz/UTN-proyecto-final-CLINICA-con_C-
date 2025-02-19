﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class PacienteNegocio
    {
        public Paciente buscar(string buscarPor,string buscar)
        {
            string consulta = "";
            switch(buscarPor)
            {
                case "id":
                    consulta = "SELECT * FROM Pacientes p, Datos_Personales dp WHERE p.ID_DatosPersonales = dp.IDDatosPersonales AND p.IDPaciente = '" + buscar + "' ";
                    break;
                
                case "dni":
                    consulta = "SELECT * FROM Pacientes p, Datos_Personales dp WHERE p.ID_DatosPersonales = dp.IDDatosPersonales AND dp.dni = '" + buscar + "' ";
                    break;
            }

            Paciente paciente = new Paciente();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    paciente.idDatosPersonales = Convert.ToInt32(con.lector["IDDatosPersonales"]);
                    paciente.id = Convert.ToInt32(con.lector["IDPaciente"]);
                    paciente.nombre = (string)con.lector["nombre"];
                    paciente.apellido = (string)con.lector["apellido"];
                    paciente.dni = (string)con.lector["dni"];
                    paciente.email = (string)con.lector["email"];
                    paciente.telefono = (string)con.lector["telefono"];
                    paciente.fechaNacimiento = Convert.ToDateTime(con.lector["fechaNacimiento"]);
                }
                return paciente;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }

        public void modificar(Paciente paciente)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("UPDATE Datos_Personales SET nombre=@nombre, apellido=@apellido, dni=@dni, email=@email, telefono=@telefono, fechaNacimiento=@fechaNacimiento WHERE IDDatosPersonales = '" + paciente.idDatosPersonales + "' ");
                con.setear_parametros("@nombre",paciente.nombre);
                con.setear_parametros("@apellido",paciente.apellido);
                con.setear_parametros("@dni",paciente.dni);
                con.setear_parametros("@email",paciente.email);
                con.setear_parametros("@telefono",paciente.telefono);
                con.setear_parametros("@fechaNacimiento",paciente.fechaNacimiento.ToString("yyyy-MM-dd"));
                con.ejecutar_escritura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }

        public void agregar(Paciente paciente)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("EXEC SP_INSERTAR_PACIENTE '" + paciente.nombre + "','" + paciente.apellido + "','" + paciente.email + "','" + paciente.telefono + "','" + paciente.dni + "','" + paciente.fechaNacimiento.ToString("yyyy-MM-dd") + "', '" + paciente.fechaIngreso.ToString("yyyy-MM-dd") + "' ");
                con.ejecutar_escritura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }

        public List<Paciente> listar()
        {
            List<Paciente> pacientesList = new List<Paciente>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("SELECT * FROM Datos_Personales dp, Pacientes p WHERE dp.IDDatosPersonales = p.ID_DatosPersonales");
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    Paciente pac = new Paciente();
                    pac.idDatosPersonales = Convert.ToInt32(con.lector["IDDatosPersonales"]);
                    pac.id = Convert.ToInt32(con.lector["IDPaciente"]);
                    pac.nombre = (string)con.lector["nombre"];
                    pac.apellido = (string)con.lector["apellido"];
                    pac.dni = (string)con.lector["dni"];
                    pac.email = (string)con.lector["email"];
                    pac.telefono = (string)con.lector["telefono"];
                    pac.fechaNacimiento = Convert.ToDateTime(con.lector["fechaNacimiento"]);
                    pacientesList.Add(pac);
                }
                return pacientesList; 
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }
        
    }
}
