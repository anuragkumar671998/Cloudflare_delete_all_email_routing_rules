▶️ RUN IT
chmod +x cf_delete_all_email_routing_rules.sh
./cf_delete_all_email_routing_rules.sh

🔎 VERIFY (MUST MATCH UI)
API
curl -s \
"https://api.cloudflare.com/client/v4/zones/0848c8b48cfd5cb558ee23c224921702/email/routing/rules" \
-H "Authorization: Bearer YOUR_API_TOKEN"


Expected:

"result": []

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
