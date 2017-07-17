using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace SamplePortsWpf
{
    /// <summary>
    /// Lógica de interacción para ValueDialog.xaml
    /// </summary>
    public partial class ValueDialog : Window
    {
        private readonly AsyncPort _port;
        
        public ValueDialog(AsyncPort port)
        {
            _port = port;
            InitializeComponent();
            DataContext = this;
        }

        private void TextBox_OnPreviewTextInputValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void Button_OnClick(object sender, RoutedEventArgs e)
        {
            _port.SendData(TextBox.Text);
            Close();
        }
        
    }

    public class PortValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (string.IsNullOrEmpty(value?.ToString()))
                return new ValidationResult(false, "value cannot be empty.");

            var intValue = Convert.ToInt32(value.ToString());

            if (intValue < 0 || intValue > 10)
                return new ValidationResult(false, "Only 1 to 10 accepted");

            return new ValidationResult(true, null);
        }
    }
}
