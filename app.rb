require 'sinatra'
require_relative 'lib/deposit_manager'

get '/' do
  @deposits = DepositManager._get_deposits_list
  @depositors = DepositorManager._get_depositors_list
  erb :index
end

get '/deposits/add' do
  erb :add_deposit
end

post '/deposits/add' do
  DepositManager.new_deposit(
    Deposit.new(
      1,
      params['name'],
      params['percent'],
      params['depositor_id'],
      params['balance'],
      params['date']
    )
  )
  redirect to('/')
end

get '/deposits/edit/:index' do
  # @deposit = DepositManager.edit_deposit(params['index'], )
  @deposit = DepositManager._get_deposit(params['index'])
  erb :edit_deposit
end

post '/deposits/edit/:index' do
  @deposit = DepositManager.edit_deposit(
    params['index'],
    Deposit.new(
      params['index'],
      params['name'],
      params['percent'],
      params['depositor_id'],
      params['balance'],
      params['date']
    )
  )
  redirect to('/')
end

get '/depositors/edit/:index' do
  @depositor = DepositorManager._get_depositor(params['index'])
  erb :edit_depositor
end

get '/depositors/add' do
  erb :add_depositor
end

post '/depositors/add' do
  DepositorManager.new_depositor(
    Depositor.new(
      1,
      params['name']
    )
  )
  redirect to('/')
end

post '/depositors/edit/:index' do
  @depositor = DepositorManager.edit_depositor(
    params['index'],
    Depositor.new(
      params['index'],
      params['name']
    )
  )
  redirect to('/')
end
