class PicturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :download]

  require 'mime/types'
  # GET /pictures
  # GET /pictures.json
  def download
    @picture = Picture.find(params[:id])
    file = @picture.image.path
    disposition = 'attachment'
    mime = MIME::Types.type_for(file).first.content_type

    send_file file, :type => mime, :disposition => disposition
  end
  def like
    if session[params[:like_id]].nil? #if is no session
        current_user.likePicWall(params[:like_id])
        session[params[:like_id]] = params[:like_id] #store picture_likes in a session
        @picture = Picture.find_by_id(params[:like_id])
        @user = User.find_by_id(@picture.user_id)
        @picture.pic_likes += 1
        @user.total_likes += 1
        @picture.save!
        @user.save!
    end
  end
  def index
    like if params[:like_id]
    @pictures = Picture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
      format.js
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    if params[:challenge_picture]
      @challenge_picture = Picture.find(params[:challenge_picture])
      $challenge_picture_id = params[:challenge_picture].to_i     # $global variable
    end

    respond_to do |format|
      format.html # new.html.erb           s
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
    @picture.user_id = current_user.id
    if $challenge_picture_id
      @picture.parent = Picture.find($challenge_picture_id)
    end

    respond_to do |format|
      if @picture.save
        current_user.createPicWall(@picture)
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
        format.js
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.remove_image!
    @picture.remove_image = true
    @picture.destroy


    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

end
