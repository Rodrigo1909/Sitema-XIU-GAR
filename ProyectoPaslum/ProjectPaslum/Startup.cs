using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectPaslum.Startup))]
namespace ProjectPaslum
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
