using MRVMinem.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;



namespace MRVMinem.Repositorio
{
    public class GoogleReCAPTCHAService
    {
        private MvReCAPTCHASettings _settings;

        public GoogleReCAPTCHAService(MvReCAPTCHASettings settings)
        {
            _settings = settings;
        }

        public virtual async Task<GoogleResponse> VerifyRecaptcha(string _Token)
        {
            //GoogleReCaptchaData _MyData = new GoogleReCaptchaData()
            //{
            //    response = _Token,
            //    secret = _settings.ReCAPTCHA_Secret_Key
            //};

            var values = new Dictionary<string, string>
                    {
                        {"secret", _settings.ReCAPTCHA_Secret_Key},
                        {"response", _Token}
                    };

            HttpClient client = new HttpClient();
            var content = new FormUrlEncodedContent(values);

            //string repponse = await client.GetStringAsync($"https://www.google.com/recaptcha/api/siteverify?secret={_MyData.secret}&response={_MyData.response}");
            var repponse = await client.PostAsync($"https://www.google.com/recaptcha/api/siteverify", content);
            var captchaResponseJson = await repponse.Content.ReadAsStringAsync();
            var capresponse = JsonConvert.DeserializeObject<GoogleResponse>(captchaResponseJson);

            return capresponse;
        }

    }

    public class GoogleReCaptchaData
    {
        public string response { get; set; } //Token
        public string secret { get; set; }
    }

    public class GoogleResponse
    {
        public bool success { get; set; }
        public double score { get; set; }
        public string action { get; set; }
        public DateTime challenge_ts { get; set; }
        public string hostname { get; set; }
    }
}