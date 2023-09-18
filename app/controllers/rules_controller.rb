class RulesController < ApplicationController
    before_action :find_rule, only: [:show, :edit, :update, :delete]
    def show
        find_discount
    end

    def index
        @rules = Rule.all
    end

    def create
        rule = Rule.new(rule_params)
        discount = params[:rule_type].tableize.singularize.to_sym
        rule.ruling = discount
        rule.save
    end

    def delete
        redirect_to rules_path
    end

    private

    def find_rule
        @rule ||= Rule.find(params[:id])
    end

    def find_discount
       @ruling ||= find_rule.ruling
    end

    def rule_params
        params.require(:rule).permit(:name, :discount)
    end
end
