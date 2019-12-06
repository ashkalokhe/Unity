
using System;
using System.Runtime.InteropServices;

public class PingPlugin {
#if MAC
  private const string Import = "pingPlugin";
#endif

#if WIN
  private const string Import = ".\\..\\assets\\win\\pingPlugin.dll";
#endif
  
  [DllImport(Import)]
  [return:MarshalAs(UnmanagedType.LPStruct)]
  public static extern PingResult Ping_Native(string address);

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
        
       Ping.Execute(args[0]);
    }
}

[StructLayout(LayoutKind.Sequential)]
public class PingResult {
  public int time;
  public bool isDone;
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

    Console.WriteLine($"Managed output - time={p.Time}, isDone={p.IsDone}");
    return p;
  }

  private void Ping_Internal() {
    // dll import call
    // returns and populates 
    var res = PingPlugin.Ping_Native(this.IP);
    this.IsDone = res.isDone;
    this.Time = res.time;
  }
}