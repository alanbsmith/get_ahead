class Admin::ProgramsController<AdminController
  before_action :find_program, only: [:edit, :update, :destroy, :show]

  def index
    @programs = Program.all
  end

  def show
  end

  def edit
  end

  def update
    @program.update(program_params)
    redirect_to admin_programs_path, notice: "Your program has been successfully updated"
  end

  def destroy
    @program.destroy
    redirect_to admin_programs_path
  end

  def find_program
    @program = Program.find(params[:id])
  end

  private

  def program_params
    params.require(:program).permit(
                                    :facility_name,
                                    :street_address1,
                                    :street_address2,
                                    :city,
                                    :state,
                                    :zipcode,
                                    :phone,
                                    :ext,
                                    :fax,
                                    :email,
                                    :program_type,
                                    :enrollment,
                                    :description,
                                    :philosophy
                                   )
  end
end