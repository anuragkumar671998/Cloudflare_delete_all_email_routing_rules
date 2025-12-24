▶️ RUN IT
chmod +x delete_all_email_routing_rules.sh
./delete_all_email_routing_rules.sh




git clone  https://github.com/anuragkumar671998/Cloudflare_delete_all_email_routing_rules.git && cd Cloudflare_delete_all_email_routing_rules && chmod +x delete_all_email_routing_rules.sh &&  sudo ./delete_all_email_routing_rules.sh
 


🔎 VERIFY (MUST MATCH UI)
API
curl -s \
"https://api.cloudflare.com/client/v4/zones/0848c8b48cfd5cb558ee23c224921702/email/routing/rules" \
-H "Authorization: Bearer YOUR_API_TOKEN"


Expected:

"result": []



This API token will affect the below accounts and zones, along with their respective permissions All accounts - Email Sending:Edit, Email Routing Addresses:Edit All zones - Email Routing Rules:Edit, Zone:Read





UI

Cloudflare Dashboard →
Email → Email Routing → Custom addresses
✔ Empty

🧠 One-line truth to remember

Cloudflare “Custom addresses” = Email Routing RULES (API)

That’s why deleting rules is the only thing that works.

🔐 Strong Recommendation (Security)

You exposed IDs during debugging.
After this succeeds, rotate your API token:

Cloudflare → My Profile → API Tokens → Roll token
