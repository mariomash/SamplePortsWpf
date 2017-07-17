using System.Globalization;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

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
            var value = TextBox.Text;

            if (new PortValidationRule().Validate(value, CultureInfo.CurrentCulture) != ValidationResult.ValidResult)
                return;

            _port.SendData(value);
            Close();
        }

    }

    public class PortValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (string.IsNullOrEmpty(value?.ToString()))
                return new ValidationResult(false, "value cannot be empty.");

            var isNumeric = int.TryParse(value.ToString(), out int intValue);
            if (!isNumeric)
                return new ValidationResult(false, "value should be a number.");

            if (intValue < 0 || intValue > 10)
                return new ValidationResult(false, "Only 1 to 10 accepted");

            return new ValidationResult(true, null);
        }
    }
}
