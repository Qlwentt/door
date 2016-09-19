require_relative 'spec_helper'
require_relative '../door.rb'

describe SkipBeat::Door do
	let(:default_door){SkipBeat::Door.new("you shall not pass")}
	let(:closed_unlocked_door){SkipBeat::Door.new(false,false,"closed unlocked")}
	let(:open_unlocked_door){SkipBeat::Door.new(true,false,"unlocked open")}

	it "can display an inscrption" do
		expect(this_door.inscrption).must_equal("you shall not pass")
	end

	it "will not allow inscrption to be changed" do
		expect(proc{this_door.inscrption="hello"}).must_raise(NoMethodError)
	end

	it "(default door) starts off being closed" do
		expect(this_door.is_open?).must_equal(false)
	end

	it "(default door) starts off locked" do
		expect(this_door.is_locked?).must_equal(true)
	end

	it "can be unlocked if it is locked" do
		expect(this_door.is_locked?).must_equal(true)
		this_door.unlock
		expect(this_door.is_locked?).must_equal(false)
	end

	it "can be opened if it is closed and unlocked" do
		expect(this_door.is_open?).must_equal(false)
		expect(this_door.is_locked?).must_equal(true)
		this_door.unlock 
		this_door.open
		expect(this_door.is_open?).must_equal(true)
	end

	# it "can be reset back to default settings (closed and locked)" do
	# 	this_door.reset
	# 	status=this_door.is_open?,this_door.is_locked?
	# 	expect(status).must_equal([false,true])
	# end

	it "cannot be opened if it is closed and locked" do
		status=this_door.is_open?,this_door.is_locked?
		expect(status).must_equal([false,true])
		expect(proc{this_door.open}).must_raise(RuntimeError)
	end

	it "can be closed if it is open" do
		open_unlocked_door.close
		expect(open_unlocked_door.is_open?).must_equal(false)
	end


	it "can be locked if it is unlocked" do
		closed_unlocked_door.lock
		expect(closed_unlocked_door.is_locked?).must_equal(true)
	end

	it "can be inspected" do
		this_door.inspect.must_equal("you shall not pass")
	end
	

end