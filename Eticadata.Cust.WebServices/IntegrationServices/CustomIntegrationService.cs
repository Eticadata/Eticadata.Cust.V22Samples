using System.Diagnostics;

namespace Eticadata.Cust.WebServices.IntegrationServices
{
    public class CustomIntegrationService : ERP.CustomService
    {
        public override bool Start()
        {
            EventLog.WriteEntry("ERP.e.DataIntegrator", $"Services started at '{etiApp.ActiveEmpresa.BDados}.", EventLogEntryType.Information);
            return true;
        }

        public override void Stop()
        {
            EventLog.WriteEntry("ERP.e.DataIntegrator", $"Services stoped at '{etiApp.ActiveEmpresa.BDados}.", EventLogEntryType.Information);
            etiApp.Dispose();
        }

        public override void Work()
        {
            try
            {
                EventLog.WriteEntry("ERP.e.DataIntegrator", $"Services started at '{etiApp.ActiveEmpresa.BDados}.", EventLogEntryType.Information);
            }
            catch (System.Exception ex)
            {
                EventLog.WriteEntry("ERPv19.e.DataIntegrator", ex.Message, EventLogEntryType.Error);
            }
        }
    }
}