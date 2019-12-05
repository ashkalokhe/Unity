
using System;
using System.Runtime.InteropServices;

public class PingPlugin {
  private const string Import = "pingPlugin";
  
  [DllImport(Import)]
  public static extern IntPtr Ping_Native(string address);

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
        
       //IntPtr res = Ping(args[0]);
       Ping.Execute(args[0]);
    }
}

public class Ping {

  private Ping(string ipAddress) {
    IP = ipAddress;
  }

  public string IP { get; set; }
  public int Time { get; set; }
  public bool IsDone { get; set; }

  public static Ping Execute(string ipAddress) {
    var p = new Ping(ipAddress);
    p.Ping_Internal();
    return p;
  }

  private void Ping_Internal() {
    // dll import call
    // returns and populates 
    IntPtr res = PingPlugin.Ping_Native(this.IP);

  }
}