# # not used
# class Workflow::Base < ApplicationRecord
# 	self.table_name = "workflows"
# 	belongs_to :workable, :polymorphic => true
# 	state_machine :status, initial: :in_progress do
# 		before_transition to: :submitted, do: :update_qoute_request_status
# 		event :submit do
# 			transition [:in_progress] => :submitted
# 		end
# 		event :complete do
# 			transition [:submitted] => :completed
# 		end

# 		# state :submitted, :human_name => "Pending"
# 		# state :completed, :human_name => "Reject/Accepted"
# 	end
# end
