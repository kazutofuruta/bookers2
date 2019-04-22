class HomesController < ApplicationController

 before_action :authenticate_user!, except: [:top]

def new
end

end
