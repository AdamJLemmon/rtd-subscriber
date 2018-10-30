Home
=====


Middleware to enable corporations to create / manage subscriptions
Corporations may use backend service to manage their subscriptions, create secure subscription registry, tied to a given address(private key), cannot be faked

Providers:
Ie. telecomms
Create a subscription registry
Via web app

Subscribers:
Download mobile app, creates private keys for account ownership
Subscribe to subscription registry by sending amount of value for given time period

Use Cases:
Telcos, our docs, etc.

Challenges:
What if a phone / private key is lost?
Account ownership?
Payment methods?  Eth, dai, USD?
Scaling!  Withdrawing / collecting from each account is not suitable

Usage:
Telco creates a subscript registry / we provide one
User download or use existing mobile app, this will create an account on their device, storing private keys only locally, optional remote backup of course
Users may then subscribe to their services, they will have the option to use Dai or continue using their existing payment method, ie. credit card
Registry is used to confirm subscription still active and valid
Payment may be made via standard rails
Only opening and cancellation needs to occur on chain, simply a check to validate that the subscription is still active, payment may occur in a wide variety of other modalities then
This allows minimal infrastructure for the provider as well as reduction in fraud and other identity related issues
For subscribers they have the guarantees and transparency into viewing their subscription as well as the ability to cancel it at anytime!

App:
Provider
Dashboard to create subscription types as well as monitor active subscriptions etc.
Subscriber
Mobile app to signup, review and monitor
Payment setup

Arch:
- subscription as an NFT?
- 

Projects:
Simplified piper spec: https://github.com/ethereum/EIPs/issues/948#issuecomment-376213214
EIP: https://github.com/ethereum/EIPs/issues/948
ERC: https://github.com/ethereum/EIPs/pull/1337
https://github.com/austintgriffith/tokensubscription.com
https://github.com/cryppadotta/dotta-license
