# Rails Engine
Rails Engine is a Turing School of Software and Design Module 3 group project.  We were required to use Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema. The RaileEngine data was imported from the following SalesEngine CSV files by building rake tasks:

[CSV Files](https://github.com/turingschool-examples/sales_engine/tree/master/data)

### Learning Goals
- Build Single-Responsibility controllers to provide a well-designed and versioned API.
- Use controller tests to drive your design.
- Use Ruby and ActiveRecord to perform more complicated business intelligence.

### Data Categories
- Customers
- Invoices
- Items
- Invoice Items
- Merchants
- Transactions

### Details
Our RailsEngine API provides three types of Endpoints: Record, Relationship, and Business Intelligence.

Record Endpoints:
- Each data category has the following controller actions: index, show, find all (index), and find (show).  The two find actions (index and show) have a devoted find controller and can be queried by any attribute of a specific data category e.g. Customers can be queried using first name or last name, and Invoices can be queried using customer id, merchant id, and status.

Relationship Endpoints:
- Users can query through a Record Endpoint's relationships.  For example, users can query for all of a Merchant's Customers (merchants having a customer controller with an index action), or all of a Customer's Invoices (customers having an invoices controller with an index action).

Business Intelligence Endpoints:
- Users can query based on business metrics.  For example, users can query for the Top Merchants based on revenue generated and specify the number (quantity) of merchants to be returned in the ranking.


### Project Links
[Rails Engine Github URL](https://github.com/dtinianow/rails_engine)

[Rails Engine Project Spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)

[Rails Engine Spec Harness](https://github.com/turingschool/rales_engine_spec_harness)

Contributors:
* [Matthew Packer](https://github.com/matthewrpacker)
* [David Tinianow](https://github.com/dtinianow)
