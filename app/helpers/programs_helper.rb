module ProgramsHelper

  def there_are_no_openings?(program)
    program.enrollment < 1
  end
end
