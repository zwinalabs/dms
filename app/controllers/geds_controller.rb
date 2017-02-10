# encoding: utf-8
class GedsController < ApplicationController

  before_filter  :set_ged, only: [:edit, :update, :destroy, :remove_ged, :delete]
  respond_to :html, :js

  def set_geds
    @ged = Ged.find(params[:id])
  end

  # GET /geds
  # GET /geds.json
  def index
    @geds = Ged.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @geds }
    end
  end

  # GET /geds/1
  # GET /geds/1.json
  def show
    @ged = Ged.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ged }
    end
  end

  # GET /geds/new
  # GET /geds/new.json
  def new
    @ged = Ged.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ged }
    end
  end

  # GET /geds/1/edit
  def edit
    @ged = Ged.find(params[:id])
  end

  # POST /geds
  # POST /geds.json
  def create
    @ged = Ged.new(params[:ged])
    @ged.user = User.current
    #binding.pry
    @ged.issue_id = params[:ged]["issue_id"]
    respond_to do |format|
      if @ged.save
        @geeds = Ged.all(:conditions => ["issue_id=?", params[:ged]["issue_id"]])
        @issue = Issue.find(params[:ged]["issue_id"])
        flash[:notice] = 'Lien GED a été ajouté avec succès.'
        format.html { redirect_to @ged, notice: 'Ged was successfully created.' }
        format.json { render json: @ged, status: :created, location: @ged }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @ged.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /geds/1
  # PUT /geds/1.json
  def update
    respond_to do |format|
      if @ged.update_attributes(params[:ged])
        format.html { redirect_to @ged, notice: 'Ged was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ged.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geds/1
  # DELETE /geds/1.json
  def destroy
    @ged.destroy

    respond_to do |format|
      format.html { redirect_to geds_url }
      format.json { head :no_content }
      format.js
    end
  end

  def remove_ged
    #binding.pry
    @ged = Ged.find(params[:id])
    @ged.destroy
    respond_to do |format|
      format.html { redirect_to geds_url }
      format.json { head :no_content }
      format.js
    end
  end
  def delete
    @ged = Ged.destroy(params[:id])
    flash[:notice]="Le GED a &eacute;t&eacute; supprim&eacute;".html_safe
    respond_to do |format|
      format.html { redirect_to geds_url }
      format.json { head :no_content }
      format.js { render js: "jQuery('#ged-#{@ged.id}').remove();" }
    end
  end

  private
  def set_ged
    @ged = Ged.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
