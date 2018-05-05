class OauthUserCreator
  attr_reader :info, :spree_current_user

  def initialize(user_info, spree_current_user)
   
    @info = user_info
    @current_user = spree_current_user
  end

  def call
    identity = Identity.find_or_initialize_by(uid: info.uid, provider: info.provider)
    if @current_user
      if identity.user == @current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        return nil
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        identity.user = @current_user
        identity.save!
        return identity.user
      end
    else
      if identity.user.present?
        # The identity we found had a user associated with it
        return identity.user
      else
        # No user associated with the identity so we need to create a new one
        @user = find_or_create_user_from_oauth
        
        if @user.persisted?
          @order.update(user: @user) if @order && !@order.user
          if !@user.spree_api_key?
            @user.generate_spree_api_key!
          end
          identity.user = @user
          identity.save!
          return @user
        else
          return nil
        end
      end
    end
  end

  private
  def find_or_create_user_from_oauth
    user = Spree::User.find_by(email: info.email)
    #check if user is present in db.
    if !user.present?
      user = Spree::User.create(email: info.email)
      if user.new_record?
        user.password = SecureRandom.hex
        user.save
        return user
      end  
    else 
      user
    end
  end
end
