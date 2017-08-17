using Xunit;
using SamplePortsWpf;

namespace Tests
{
    public class Test
    {
        [Fact]
        public void AsyncPortNameShouldReturnExpectedValue()
        {
            const string portName = "portName";
            var port = new AsyncPort(portName);

            Assert.Equal(portName, port.Name);
        }
    }
}
