﻿using System.Runtime.Serialization;

namespace SamplePortsWpf
{
    public enum PortStatus
    {
        [EnumMember] Disconnected,
        [EnumMember] Connected
    }
}