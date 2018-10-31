pragma solidity 0.4.24;

// Single or multi subscription?  ie. may a user hold multiple subscriptions here?
// Questions on on-chain scaling?  If the service provider needs to collect from 1000s of subscribers
contract WIPSubscriptionRegistry {
    // Some way to store the active subscriptions
    // Currently just single subscription
    mapping(address => bool) public activeSubscriptions_;

    // some payment schedule?

    // some payment amount?

    // allow users to specify the token they wish to pay the subscription in?

    /**
        ie from piper
        address token: defines the token contract which payments are paid from.
        address provider: the address of the provider
        uint256 time_unit: the number of seconds per time unit.
        uint256 tokens_per_time_unit: the number of tokens that can be paid towards the subscription per time_unit.
        uint256 last_payment_at: the timestamp when the last payment was made.
        The triggerPayment method would call token.transfer(provider, (now - last_payment_at) * tokens_per_time_unit / time_unit)`.
     */



    /**
        @notice Allow a user to subscribe to the service 
        @dev Transactions must be sent directly by the user wishing to subscribe

        msg.sender is the account that is subscribing.  Enforce value to be sent here?  Define the subscriptin token etc?
     */
    function subscribe() external returns (bool) {}

    /**

        @notice Allow a user to subscribe to the service via a delegated transaction. 
        @dev Ensure transactions are delegated to the service provider

        No value required likely, payments will be made off chain for this form of account
     */
    function delegatedSubscribe() external returns (bool) {}

    /**
        For the provider to call to collect the payments they are owed
        ???  When to call this?  Who to iterate over?
     */
    function triggerPayment() external returns (bool) {}

    /**
        @notice Allow the subscriber to cancel their subscription at any time
     */
    function cancelSubscription() external returns (bool) {}

    /**
        @notice Allow the subscriber to cancel their subscription at any time
        @dev Via a delegated transaction, signed by the subscriber, sent by the provider?
     */
    function delegateCancelSubscription() external returns (bool) {}
}