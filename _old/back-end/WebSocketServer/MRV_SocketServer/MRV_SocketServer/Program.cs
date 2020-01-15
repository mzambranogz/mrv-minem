using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fleck;
using System.Configuration;

namespace MRV_Socket
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Iniciando WebSocket Server...");
            Console.WriteLine("");
            string ip = ConfigurationManager.AppSettings["IP_WS"];
            WebSocketServer servidor = new WebSocketServer(ip);
            List<IWebSocketConnection> clientes = new List<IWebSocketConnection>();
            servidor.Start((cliente) =>
            {
                cliente.OnOpen = () =>
                {
                    clientes.Add(cliente);
                    Console.WriteLine("Se conecto el cliente con IP: {0}", cliente.ConnectionInfo.ClientIpAddress);
                };
                cliente.OnClose = () =>
                {
                    clientes.Remove(cliente);
                    Console.WriteLine("Se desconecto el cliente con IP: {0}", cliente.ConnectionInfo.ClientIpAddress);
                };
                cliente.OnMessage = (string mensaje) =>
                {
                    Console.WriteLine("Mensaje Recibido: {0}", mensaje);
                    clientes.ForEach(x => x.Send(mensaje));
                };
            });
            Console.WriteLine("Pulsa Enter para Finalizar el Servidor");
            Console.ReadLine();
        }
    }
}
