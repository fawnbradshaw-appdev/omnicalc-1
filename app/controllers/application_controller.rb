class ApplicationController < ActionController::Base

def blank_square_form

  render({ :template => "calculation_templates/square_form.html.erb"})
  
end

def calculate_square
  @num = params.fetch("number").to_f
  @square_of_num = @num * @num

  render({ :template => "calculation_templates/square_results.html.erb"})

end


def square_root_form
  render({ :template => "calculation_templates/square_root_form.html.erb"})
end

def calculate_square_root
  @num = params.fetch("user_number").to_f
  @square_root_of_num = @num ** (1/2.0)

  render({ :template => "calculation_templates/square_root_results.html.erb"})
end


def payment_form
  render({ :template => "calculation_templates/payment_form.html.erb"})
end

def calculate_payment
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @pv = params.fetch("user_pv").to_f

  @periods = @years * 12.0
  @monthly_apr = @apr/100/12.0

  @numerator = @monthly_apr * @pv
  @denominator = 1.0-(1+@monthly_apr) ** (@periods * (-1))
  @payment = @numerator/@denominator

  render({ :template => "calculation_templates/payment_results.html.erb"})
end


def random_form
  render({ :template => "calculation_templates/random_form.html.erb"})
end


def calculate_random
  @lower = params.fetch("user_min").to_f
  @upper = params.fetch("user_max").to_f
  @rand_num = rand(@lower..@upper)
  render({ :template => "calculation_templates/rand_results.html.erb"})

end

end
