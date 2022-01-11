# frozen_string_literal: true

module Users
  class ProfilesController < Users::Base
    def show
      @profile = current_user.profile
      unless @profile
        redirect_to new_users_profile_url
      end
    end

    def new
      if current_user.profile
        redirect_to users_profile_url
      end
      @profile = current_user.build_profile
    end

    def create
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        flash[:success] = '作成完了'
        redirect_to users_profile_url
      else
        render :edit
      end
    end

    def edit
      @profile = current_user.profile
    end

    def update
      @profile = current_user.profile
      @profile.assign_attributes(profile_params)
      if @profile.save
        flash[:success] = '更新完了'
        redirect_to users_profile_url
      else
        render :edit
      end
    end

    private
      def profile_params
        params.require(:profile).permit(:age, :address, :tel)
      end
  end
end
