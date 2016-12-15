## Voucherify Ruby SDK

<p align="center">
<b><a href="#migration-from-0-x">Migration from 0.x</a></b>
|
<b><a href="#setup">Setup</a></b>
|
<b><a href="#error-handling">Error handling</a></b>
|
<b><a href="#development">Development</a></b>
|
<b><a href="#contributing">Contributing</a></b>
|
<b><a href="#changelog">Changelog</a></b>
</p>

<p align="center">
API:
<a href="#vouchers-api">Vouchers</a>
|
<a href="#redemptions-api">Redemptions</a>
|
<a href="#customers-api">Customers</a>
|
<a href="#utils">Utils</a>
</p>

---

## Setup

Add this line to your application's Gemfile:

```ruby
gem 'voucherify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voucherify

[Log-in](http://app.voucherify.io/?utm_source=github&utm_medium=sdk&utm_campaign=acq#/login) to Voucherify web interface and obtain your Application Keys from [Configuration](https://app.voucherify.io/?utm_source=github&utm_medium=sdk&utm_campaign=acq#/app/configuration):

```ruby
require 'voucherify'

voucherify = Voucherify::Client.new({
  :applicationId => 'YOUR-APPLICATION-ID',
  :clientSecretKey => 'YOUR-CLIENT-SECRET-KEY'
})
```

## API

This SDK is fully consistent with restful API Voucherify provides.
Detailed descriptions and example responses you will find at [official docs](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq).
Method headers point to more detailed params description you can use.

### Vouchers API
Methods are provided within `voucherify.vouchers.*` namespace.
- [Create Voucher](#create-voucher)
- [Get Voucher](#get-voucher)
- [Update Voucher](#update-voucher)
- [Delete Voucher](#delete-voucher)
- [List Vouchers](#list-vouchers)
- [Enable Voucher](#enable-voucher)
- [Disable Voucher](#disable-voucher)
- [Voucher Redemption](#voucher-redemption)
- [Validate Voucher](#validate-voucher)
- [Redeem Voucher](#redeem-voucher)
- [Publish Vouchers](#publish-vouchers)

#### [Create Voucher]
```ruby
voucherify.vouchers.create(code, options)
```
Check [voucher object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-voucher-object).
#### [Get Voucher]
```ruby
voucherify.vouchers.get(code)
```
#### [Update Voucher]
```ruby
voucherify.vouchers.update(voucher)
```
#### [List Vouchers]
```ruby
voucherify.vouchers.list
```
#### [Enable Voucher]
```ruby
voucherify.vouchers.enable(code)
```
#### [Disable Voucher]
```ruby
voucherify.vouchers.disable(code)
```
#### [Voucher Redemption]
```ruby
voucherify.vouchers.redemption(code)
```
#### [Validate Voucher]
```ruby
voucherify.vouchers.validate(code, [context])
```
#### [Redeem Voucher]
```ruby
voucherify.vouchers.redeem(code, [tracking_id])
```
#### [Publish Vouchers]
```ruby
voucherify.vouchers.publish(campaign_name)
```

---

### Redemptions API
Methods are provided within `voucherify.redemptions.*` namespace.

- [List Redemptions](#list-redemptions)
- [Rollback Redemption](#rollback-redemption)

#### [List Redemptions]
```ruby
voucherify.redemptions.list
voucherify.redemptions.list(params)
```
#### [Rollback Redemption]
```javascript
voucherify.redemptions.rollback(redemption_id, [tracking_id], [reason])
```
Check [redemption rollback object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-redemption-rollback-object).

---

### Customers API
Methods are provided within `voucherify.customers.*` namespace.

- [Create Customer](#create-customer)
- [Get Customer](#get-customer)
- [Update Customer](#update-customer)
- [Delete Customer](#delete-customer)

#### [Create Customer]
```ruby
voucherify.customers.create(customer)
```
Check [customer object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-customer-object).
#### [Get Customer]
```ruby
voucherify.customers.get(customer_id)
```
#### [Update Customer]
```ruby
voucherify.customers.update(customer)
```
#### [Delete Customer]
```ruby
voucherify.customers.delete(customer_id)
```

---

### Migration from 0.x

Version 1.x of the SDK is not backwards compatible with versions 0.x.
Changes made in version 1.x mostly relate to grouping methods within namespaces.
So all you need to do is to follow the list bellow and just replace methods
with their namespaced equivalent.

##### Client
- `Voucherify.new(params)` - `Vocherify::Client.new(params)`

##### Vouchers
- `voucherify.create(voucher)` - [voucherify.vouchers.create](#create-voucher)
- `voucherify.get(voucher_code)` - [voucherify.vouchers.get](#get-voucher)
- `voucherify.update(voucher)` - [voucherify.vouchers.update](#update-voucher)
- `voucherify.list(params)` - [voucherify.vouchers.list](#list-vouchers)
- `voucherify.enable(voucher_code)` - [voucherify.vouchers.enable](#enable-voucher)
- `voucherify.disable(voucher_code)` - [voucherify.vouchers.disable](#disable-voucher)
- `voucherify.redemption(voucher_code)` - [voucherify.vouchers.redemption](#voucher-redemption)
- `voucherify.validate(voucher_code, params)` - [voucherify.vouchers.validate](#validate-voucher)
- `voucherify.redeem(voucher_code, tracking_id)` - [voucherify.vouchers.redeem](#redeem-voucher)
- `voucherify.publish(campaign_name)` - [voucherify.vouchers.publish](#publish-vouchers)

##### Redemptions
- `voucherify.redemptions(params)` - [voucherify.redemptions.list](#list-redemptions)
- `voucherify.rollback(redemption_id, tracking_id, reason)` - [voucherify.redemptions.rollback](#rollback-redemptions)

##### Customers
- `voucherify.create_customer(customer)` - [voucherify.customers.create](#create-customer)
- `voucherify.get_customer(customer_id)` - [voucherify.customers.get](#get-customer)
- `voucherify.update_customer(customer)` - [voucherify.customers.update](#update-customer)
- `voucherify.delete_customer(customer_id)` - [voucherify.customers.delete](#delete-customer)

##### Util

- `Utils.round_money(value)` - `Voucherify::Utils.round_money(value)`
- `Utils.validate_percent_discount(discount)` - `Voucherify::Utils.validate_percent_discount(discount)`
- `Utils.validate_amount_discount(discount)` - `Voucherify::Utils.validate_amount_discount(discount)`
- `Utils.validate_unit_discount(discount)` - `Voucherify::Utils.validate_unit_discount(discount)`
- `Utils.calculate_price(base_price, voucher, [unit_price])` - `Voucherify::Utils.calculate_price(base_price, voucher, [unit_price])`
- `Utils.calculate_discount(base_price, voucher, [unit_price])` - `Voucherify::Utils.calculate_discount(base_price, voucher, [unit_price])`

---

### Utils

#### Available methods

- `Voucherify::Utils.round_money(value)`
- `Voucherify::Utils.validate_percent_discount(discount)`
- `Voucherify::Utils.validate_amount_discount(discount)`
- `Voucherify::Utils.validate_unit_discount(discount)`
- `Voucherify::Utils.calculate_price(base_price, voucher, [unit_price])`
- `Voucherify::Utils.calculate_discount(base_price, voucher, [unit_price])`

---

## Error handling

This voucherify gem uses [rest-client](https://github.com/rest-client/rest-client) under the hood for handling HTTP calls. In case of an HTTP 4xx or 5xx error, a RestClient exception is thrown. The server's specific response is available in `.response` of the exception object.

```ruby
begin
  voucherify.vouchers.publish('test')
rescue => e
  JSON.parse(e.response)
end
```

```json
{
    "code": 400,
    "message": "Couldn't find any voucher suitable for publication."
}
```

Please refer to [rest-client documentation](https://github.com/rest-client/rest-client#exceptions-see-httpwwww3orgprotocolsrfc2616rfc2616-sec10html) for more detailed information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rspective/voucherify-ruby-sdk.

## Changelog
- **2016-12-15** - `1.0.0` - introduced namespaces, unified method names, updated README. Migration from versions 0.x required [migration from version 0.x](#migration-from-0x)
- **2016-12-02** - `0.8.2` - support gift vouchers in utils, fix price and discount calculations for amount discounts 
- **2016-10-03** - `0.8.1` - publish update 
- **2016-08-02** - `0.8.0` - validate voucher
- **2016-07-18** - `0.7.0` - voucher udpate
- **2016-07-05** - `0.6.0` - new utils module
- **2016-06-16** - `0.5.0` - unified naming convention
- **2016-06-12** - `0.4.0` - new customer sdk methods
- **2016-05-24** - `0.3.0` - new publish structure
- **2016-04-27** - `0.2.0` - rollback redemption
- **2016-04-13** - `0.1.3` - bugfix in redeem()
- **2016-04-13** - `0.1.2` - removed dependency to `pry`
- **2016-04-12** - `0.1.1` - minor gemspec changes
- **2016-04-12** - `0.1.0` - First version:
  - Authentication
  - Voucher information: *retrieve voucher*, *list vouchers*, *retrieve redemptions*, *list redemptions*
  - Voucher operations: *redeem voucher*, *publish voucher*, *create voucher*, *enable/disable voucher*


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
