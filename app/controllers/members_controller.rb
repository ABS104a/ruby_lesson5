# coding: utf-8

class MembersController < ApplicationController
  # 会員一覧
  def index
    @members = Member.order("number")
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980,1,2))
  end

  def edit
    @member = Member.find(params[:id])      
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
            redirect_to @member, notice: "会員を登録しました"
    else
            render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
            redirect_to @member, notice: "会員情報を更新しました"
    else
            render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を消去しました"
  end
end
