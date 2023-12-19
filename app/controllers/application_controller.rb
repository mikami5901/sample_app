class ApplicationController < ActionController::Base
    def hello
        render html: "Hello,Word"
       end
end
