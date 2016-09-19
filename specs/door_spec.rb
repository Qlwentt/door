require_relative 'spec_helper'
require_relative '../lib/door.rb'

describe SkipBeat::Door do
	let(:default_door){SkipBeat::Door.new("you shall not pass")}
	let(:closed_unlocked_door){SkipBeat::Door.new(false,false,"closed unlocked")}
	let(:open_unlocked_door){SkipBeat::Door.new(true,false,"unlocked open")}

	it "can display an inscrption" do
		expect(default_door.inscription).must_equal("you shall not pass")
	end

	it "will not allow inscrption to be changed" do
		expect(proc{default_door.inscrption="hello"}).must_raise(NoMethodError)
	end

	it "(default door) starts off being closed" do
		expect(default_door.is_open).must_equal(false)
	end

	it "(default door) starts off locked" do
		expect(default_door.is_locked).must_equal(true)
	end

	it "can be unlocked if it is locked" do
		expect(default_door.is_locked).must_equal(true)
		default_door.unlock
		expect(default_door.is_locked).must_equal(false)
	end

	it "can be opened if it is closed and unlocked" do
		expect(default_door.is_open).must_equal(false)
		expect(default_door.is_locked).must_equal(true)
		default_door.unlock 
		default_door.open
		expect(default_door.is_open).must_equal(true)
	end

	# it "can be reset back to default settings (closed and locked)" do
	# 	default_door.reset
	# 	status=default_door.is_open?,default_door.is_locked?
	# 	expect(status).must_equal([false,true])
	# end

	it "cannot be opened if it is closed and locked" do
		status=default_door.is_open,default_door.is_locked
		expect(status).must_equal([false,true])
		expect(proc{default_door.open}).must_raise(RuntimeError)
	end

	it "can be closed if it is open" do
		skip
		open_unlocked_door.close
		expect(open_unlocked_door.is_open).must_equal(false)
	end


	it "can be locked if it is unlocked" do
		skip
		closed_unlocked_door.lock
		expect(closed_unlocked_door.is_locked).must_equal(true)
	end


	

end