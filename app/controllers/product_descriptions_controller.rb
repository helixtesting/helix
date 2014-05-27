class ProductDescriptionsController < ApplicationController
  # GET /product_descriptions
  # GET /product_descriptions.json
  def index
    @product_descriptions = ProductDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_descriptions }
    end
  end

  # GET /product_descriptions/1
  # GET /product_descriptions/1.json
  def show
    @product_description = ProductDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_description }
    end
  end

  # GET /product_descriptions/new
  # GET /product_descriptions/new.json
  def new
    @product_description = ProductDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_description }
    end
  end

  # GET /product_descriptions/1/edit
  def edit
    @product_description = ProductDescription.find(params[:id])
  end

  # POST /product_descriptions
  # POST /product_descriptions.json
  def create
    @product_description = ProductDescription.new(params[:product_description])

    respond_to do |format|
      if @product_description.save
        format.html { redirect_to @product_description, notice: 'Product description was successfully created.' }
        format.json { render json: @product_description, status: :created, location: @product_description }
      else
        format.html { render action: "new" }
        format.json { render json: @product_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_descriptions/1
  # PUT /product_descriptions/1.json
  def update
    @product_description = ProductDescription.find(params[:id])

    respond_to do |format|
      if @product_description.update_attributes(params[:product_description])
        format.html { redirect_to @product_description, notice: 'Product description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_descriptions/1
  # DELETE /product_descriptions/1.json
  def destroy
    @product_description = ProductDescription.find(params[:id])
    @product_description.destroy

    respond_to do |format|
      format.html { redirect_to product_descriptions_url }
      format.json { head :no_content }
    end
  end
end
