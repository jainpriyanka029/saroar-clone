module DeepClone

	def mark_temp
		self.try :draft=, true
	end

	def get_clone(associates: [], temp: false)

		# duplicate
		clone = self.dup
		clone.created_at = Time.now

		# preserve one or more associations in the clone.
		# note that there is generally no reason to call this at the top level,
		# since the top-level associations are preserved by just copying the :ids.
		# :associates is purely for the recursive calls.
		associates.each do |association|
			# clone.send "#{association.to_s}=", self.send(association)
			# clone.send "#{association.class.name.underscore}=".to_sym, parent if parent
			clone.send "#{association.class.symbolize}=".to_sym, association
		end

		clone.save
		clone.mark_temp if temp

		# clone each dependent class in turn
		# each dependent must update its association to point to the new clone
		self.dependents.each do |child|
			child.get_clone(temp: temp, associates: [clone])
		end

		clone
	end

	# overridden via `clones_dependents`
	def dependents; []; end

	def self.included(base)
		base.instance_eval do

			# overridden via `clones_dependents`
			def dependents; []; end

			# specify dependents to be recursively cloned
			def clones_dependents(*dependents)
				self.send(:define_method, :dependents) do
					dependents.collect{ |dependent| self.send dependent }.flatten
				end
				self.instance_eval "def dependents; #{dependents}; end"
			end
		end
	end

end