class AddPaperclipToDishes < ActiveRecord::Migration
  def change	
  	add_attachment :dishes, :image
  end
end
