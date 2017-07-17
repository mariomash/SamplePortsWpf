using System;

namespace SamplePortsWpf
{
    public class ReceivedDataEventArgs : EventArgs
    {
        public string Message { get; }

        public ReceivedDataEventArgs(string message)
        {
            Message = message;
        }
    }
}