using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SamplePortsWpf
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ObservableCollection<AsyncPort> _availablePorts;

        public MainWindow()
        {
            InitializeComponent();

            _availablePorts = new ObservableCollection<AsyncPort>();

            var ports = SerialPort.GetPortNames();

#if DEBUG
            ports = new[] { "COMTEST", "COMTEST2" };
#endif

            foreach (var portName in ports)
            {
                var port = new AsyncPort(portName);
                port.OnDataReceived += ParseReceivedData;

                _availablePorts.Add(port);
#if DEBUG
                if (port.Name == @"COMTEST")
                    port.ReceivedData = "a";
#endif
            }

            LvPorts.ItemsSource = _availablePorts;
        }

        private void ParseReceivedData(object sender, ReceivedDataEventArgs args)
        {
            var port = (AsyncPort)sender;

            if (args.Message == @"a")
            {
                port.Status = PortStatus.Connected;
            }

            var view = CollectionViewSource.GetDefaultView(_availablePorts);
            view.Refresh();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;

            if (!(button.DataContext is AsyncPort port))
                return;

            port.SendData(@"e");

            var popup = new ValueDialog(port);

            popup.ShowDialog();

        }
    }
}
