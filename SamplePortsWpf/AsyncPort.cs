using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SamplePortsWpf
{
    public class AsyncPort : IDisposable
    {
        private readonly SerialPort _serialPort;

        private string _receivedData;

        public string ReceivedData {
            set {

                LastReceivedData = DateTime.Now;
                _receivedData = value;

                if (_receivedData.Length == 0)
                    return;

                var args = new ReceivedDataEventArgs($"{_receivedData}");

                OnDataReceived?.Invoke(this, args);
            }
            get => $"{_receivedData}";
        }

        public string Name { get; set; }

        public DateTime LastReceivedData;

        public string LastReceivedDataHumanFormat => _receivedData != null ? LastReceivedData.ToShortTimeString() : string.Empty;

        public PortStatus Status { get; set; }

        public event DataHandler OnDataReceived;

        public delegate void DataHandler(object obj, ReceivedDataEventArgs args);

        public AsyncPort(string portName)
        {
            Name = portName;
            Status = PortStatus.Disconnected;
            _serialPort = new SerialPort(Name);
            ConnectPort();
        }

        public void SendData(string message)
        {
#if DEBUG
            // Let's fake the response
            // as this is a test
            switch (message)
            {
                case "i":
                    ReceivedData = "a";
                    break;
                case "e":
                    // Do Nothing
                    break;
                default:
                    ReceivedData = $"{message}";
                    break;
            }
#else
            // Here we do a sample conversion...
            // I don't know if we should send chars, bytes...
            // We don't have retry logic etc... this should come
            // first and also do the correct unit tests...
            if (_serialPort.IsOpen)
                _serialPort.Write(message.ToCharArray(), 0, message.Length);
#endif
        }

        private void ConnectPort()
        {
            _serialPort.BaudRate = 38400;
            _serialPort.Handshake = Handshake.None;
            _serialPort.Parity = Parity.None;
            _serialPort.DataBits = 8;
            _serialPort.StopBits = StopBits.One;
            _serialPort.ReadTimeout = 500;
            _serialPort.WriteTimeout = 50;

            // Here we use events, but sometimes it's
            // not the best (for example using MONO under linux/BSD)
            _serialPort.DataReceived += ReceivedDataHandler;

#if DEBUG
#else
            _serialPort.Open();

            SendData(@"i");

#endif
        }

        private void ReceivedDataHandler(object sender, SerialDataReceivedEventArgs e)
        {
            var port = (SerialPort)sender;
            var data = port.ReadExisting();
            ReceivedData = data;
        }

        public void Dispose()
        {
            _serialPort.Close();
            _serialPort.Dispose();
        }
    }

}
