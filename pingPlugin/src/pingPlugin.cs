
using System;
using System.Runtime.InteropServices;

class PingPlugin {

  private const string Import = "pingPlugin";

  [DllImport(Import)]
  static extern void ping();

  public static void Main(string[] args)
    {
      OperatingSystem os = Environment.OSVersion;
      PlatformID     pid = os.Platform;
      switch (pid) 
      {
          case PlatformID.Win32NT:
          case PlatformID.Win32S:
          case PlatformID.Win32Windows:
          case PlatformID.WinCE:
              Console.WriteLine("This is windows os");
              break;
          case PlatformID.Unix:
              Console.WriteLine("This is Unix os");
              break;
          default:
              Console.WriteLine("This is mac os");
              break;
      }

        Console.WriteLine ("Hello to managed PingPlugin");
        ping();
    }
}